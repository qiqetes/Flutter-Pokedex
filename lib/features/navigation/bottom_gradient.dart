import 'package:flutter/material.dart';
import 'package:pokedex_flutter/models/poke_type.dart';

class BottomGradient extends StatelessWidget {
  const BottomGradient({super.key});

  @override
  Widget build(BuildContext context) {
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
                const Color.fromARGB(0, 255, 255, 255),
                PokeType.electric.color // TODO: change to most used color
              ],
            ),
          ),
        ),
      ),
    );
  }
}
