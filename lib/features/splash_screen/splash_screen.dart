import 'package:flutter/material.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/pokeball_logo_white.png',
                width: 80,
                color: kColBlack,
              ),
              const SizedBox(height: 20),
              const Text(
                'Pokédex',
                style: TextStyle(
                  color: kColBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Got to catch 'em all!",
                style: TextStyle(
                  color: kColBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
