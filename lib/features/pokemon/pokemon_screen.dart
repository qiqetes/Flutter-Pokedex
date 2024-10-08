import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_card.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/current_pokemon_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({super.key, required this.pokemonId});
  final String pokemonId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Pokemon? pokemon = ref.watch(currentPokemonProvider.notifier).state;
    if (pokemon == null) {
      return const Center(child: Text('Error loading Pokemon'));
    }

    List<PokeType> pokeType = pokemon.types;
    bool hasTwoTypes = pokeType.length > 1;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: pokeType.first.color,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: _BackgroundTitle(pokemon: pokemon)),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${pokemon.height} feet'),
                        const SizedBox(height: 16),
                        const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut purus eget libero. Nulla facilisi. Nullam nec nunc nec libero."),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            for (PokeType type in pokeType)
                              RoundedContainer(
                                margin: const EdgeInsets.only(right: 16),
                                color: type.color,
                                child: Text(
                                  type.name.capitalize(),
                                  style: TextStyle(
                                    color: type.color.darken(0.35),
                                  ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(0, -60),
              child: Image.network(
                pokemon.spriteUrl,
                filterQuality: FilterQuality.none,
                scale: 1 / 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundTitle extends StatelessWidget {
  const _BackgroundTitle({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final bool hasTwoTypes = pokemon.types.length > 1;
    return Stack(
      children: [
        Positioned(
          right: -80,
          top: -50,
          child: Image.asset(
            'assets/images/pokeball_logo_white.png',
            width: 400,
            height: 400,
            color: hasTwoTypes
                ? pokemon.types[1].color.withAlpha(200)
                : pokemon.types[0].secondaryColor,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
              actions: const [_CaptureButton()],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(pokemon.name.capitalize(),
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(width: 16),
                  Text(
                    "#${pokemon.id}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CaptureButton extends ConsumerWidget {
  const _CaptureButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Pokemon pokemon = ref.watch(currentPokemonProvider.notifier).state!;
    List<PokeType> pokeType = pokemon.types;
    bool isCaptured = ref.watch(capturedPokemonProvider).contains(pokemon);

    return IconButton(
      icon: AnimatedContainer(
          padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
          decoration: BoxDecoration(
            color: isCaptured ? pokeType[0].secondaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(300),
          ),
          duration: const Duration(milliseconds: 300),
          child: Row(
            children: [
              if (isCaptured) const SizedBox(width: 10),
              if (isCaptured) const Text('CAPTURED!'),
              if (isCaptured) const SizedBox(width: 16),
              Image.asset('assets/images/pokeball_logo_white.png'),
            ],
          )),
      onPressed: () {
        ref.read(capturedPokemonProvider.notifier).capture(pokemon);
      },
    );
  }
}
