import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard(
    this.pokemon, {
    super.key,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hasSecondaryType = pokemon.types.length > 1;
    bool isCaptured = ref.watch(capturedPokemonProvider).contains(pokemon);

    return RoundedButton(
      margin: const EdgeInsets.only(top: 16),
      padding: EdgeInsets.zero,
      color: pokemon.types.first.secondaryColor.withAlpha(200),
      onTap: () {
        ref.read(capturedPokemonProvider.notifier).capture(pokemon);
      },
      clipped: false,
      child: SizedBox(
        height: 190,
        child: Stack(
          children: [
            if (hasSecondaryType)
              Opacity(
                opacity: 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Transform.translate(
                        offset: const Offset(30, -40),
                        child: SvgPicture.asset(
                          'assets/images/pokeball_icon.svg',
                          width: 200,
                          color: pokemon.types.last.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 0),
                    child: Transform.scale(
                      scale: 2.3,
                      child: Image.network(
                        isAntiAlias: false,
                        filterQuality: FilterQuality.none,
                        pokemon.spriteUrl,
                        height: 140,
                      ),
                    ),
                  ),
                  Text(
                    pokemon.name.capitalize(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: pokemon.types.first.color.darken(0.35)),
                  ),
                ],
              ),
            ),
            if (isCaptured)
              Positioned(
                right: 10,
                top: 10,
                child: SvgPicture.asset(
                  'assets/images/pokeball_icon.svg',
                  width: 20,
                ),
              )
          ],
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
