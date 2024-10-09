import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/features/pokemon/providers/current_pokemon_provider.dart';
import 'package:pokedex_flutter/helpers/extensions.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';
import 'package:go_router/go_router.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard(
    this.pokemon, {
    super.key,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isCaptured = ref.watch(capturedPokemonProvider).contains(pokemon);

    return RoundedButton(
      margin: const EdgeInsets.only(top: 16),
      padding: EdgeInsets.zero,
      color: pokemon.types.first.secondaryColor.withAlpha(200),
      onTap: () {
        ref.read(currentPokemonProvider.notifier).state = pokemon;
        context.push('/pokemon/${pokemon.id}');
        // ref.read(capturedPokemonProvider.notifier).capture(pokemon);
      },
      clipped: false,
      child: SizedBox(
        height: 190,
        child: Stack(
          children: [
            if (pokemon.hasTwoTypes) _SecondaryTypeIndicator(pokemon: pokemon),
            _MainDetails(pokemon: pokemon),
            if (isCaptured) const _CapturedIndicator()
          ],
        ),
      ),
    );
  }
}

class _MainDetails extends StatelessWidget {
  const _MainDetails({
    required this.pokemon,
  });

  final Pokemon pokemon;

  Widget _image() {
    return Transform.translate(
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
    );
  }

  Widget _nameTitle() {
    return Text(
      pokemon.name.capitalize(),
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: pokemon.types.first.color.darken(0.35)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_image(), _nameTitle()],
      ),
    );
  }
}

class _CapturedIndicator extends StatelessWidget {
  const _CapturedIndicator();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 10,
      child: SvgPicture.asset(
        'assets/images/pokeball_icon.svg',
        width: 20,
      ),
    );
  }
}

class _SecondaryTypeIndicator extends StatelessWidget {
  const _SecondaryTypeIndicator({required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Opacity(
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
                pokemon.types.last.logoPath,
                width: 200,
                color: pokemon.types.last.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
