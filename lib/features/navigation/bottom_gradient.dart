import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class BottomGradient extends ConsumerWidget {
  const BottomGradient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(pokedexPaletteProvider);
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      // container with gradient from top to bottom
      child: IgnorePointer(
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kColWhite.withAlpha(0),
                palette.primary.withAlpha((0.8 * 255).floor()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
