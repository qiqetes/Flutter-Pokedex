import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class BottomGradient extends ConsumerWidget {
  const BottomGradient({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PokeType predominantType = ref.watch(predominantTypeProvider);
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
                kColWhite.withOpacity(0.0),
                predominantType
                    .secondaryColor // TODO: change to most used color
              ],
            ),
          ),
        ),
      ),
    );
  }
}
