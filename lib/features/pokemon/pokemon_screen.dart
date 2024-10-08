import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_card.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';
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
    bool isCaptured = ref.watch(capturedPokemonProvider).contains(pokemon);
    double thumbnailSize = MediaQuery.sizeOf(context).height * 0.2;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: pokeType.first.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: AnimatedContainer(
                padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                decoration: BoxDecoration(
                  color: isCaptured
                      ? pokeType[0].secondaryColor
                      : Colors.transparent,
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
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(pokemon.name.capitalize(),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(width: 16),
                Text(
                  "#${pokemon.id}",
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: screenWidth * 0.5),
              clipBehavior: Clip.none,
              color: Colors.white,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -screenWidth * 0.7,
                    child: Center(
                      child: Image.network(
                        pokemon.spriteUrl,
                        filterQuality: FilterQuality.none,
                        scale: 1 / 5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 150.0),
                    child: Column(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
