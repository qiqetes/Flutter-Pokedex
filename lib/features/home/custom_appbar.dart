import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/models/poke_type.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = PokeType.fire.color;
    final textColor = PokeType.fire.color.isDark ? kColWhite : kColBlack;
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -30,
            right: -20,
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/pokeball_logo_white.png',
                width: 190,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Pokedex",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: textColor)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
