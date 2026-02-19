import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/main.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

Pokemon _pokemon(int id, List<PokeType> types) {
  return Pokemon(
    id: id,
    name: 'pokemon-$id',
    types: types,
    spriteUrl: 'https://example.com/$id.png',
    height: 1,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('CapturedPokemon + palette', () {
    late ProviderContainer container;
    late SharedPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
      container = ProviderContainer(
        overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      );
    });

    tearDown(() {
      // The auto-dispose notifier's onDispose calls _save, which in turn reads
      // sharedPreferencesProvider. That provider is still alive at this point
      // because it is a plain (always-alive) provider, so this is safe.
      container.dispose();
    });

    test('returns default palette when empty', () {
      final palette = container.read(pokedexPaletteProvider);
      expect(palette.primary, kColPokedexRed);
      expect(palette.secondary, kColPokedexRedSecondary);
    });

    test('returns default palette on tie', () {
      final notifier = container.read(capturedPokemonProvider.notifier);
      notifier.capture(_pokemon(1, [PokeType.water]));
      notifier.capture(_pokemon(2, [PokeType.grass]));

      final palette = container.read(pokedexPaletteProvider);
      expect(palette.primary, kColPokedexRed);
      expect(palette.secondary, kColPokedexRedSecondary);
    });

    test('returns palette for predominant type', () {
      final notifier = container.read(capturedPokemonProvider.notifier);
      notifier.capture(_pokemon(1, [PokeType.water]));
      notifier.capture(_pokemon(2, [PokeType.water]));
      notifier.capture(_pokemon(3, [PokeType.grass]));

      final palette = container.read(pokedexPaletteProvider);
      expect(palette.primary, PokeType.water.color);
      expect(palette.secondary, PokeType.water.secondaryColor);
    });

    test('capture toggles and persists to local storage', () {
      final notifier = container.read(capturedPokemonProvider.notifier);
      final pokemon = _pokemon(25, [PokeType.electric]);

      notifier.capture(pokemon);
      final capturedOnce = container.read(capturedPokemonProvider);
      expect(capturedOnce, contains(pokemon));

      final rawJson = prefs.getString('captured');
      expect(rawJson, isNotNull);
      final decoded = jsonDecode(rawJson!) as List<dynamic>;
      expect(decoded.length, 1);

      notifier.capture(pokemon);
      final capturedTwice = container.read(capturedPokemonProvider);
      expect(capturedTwice, isEmpty);
    });
  });
}
