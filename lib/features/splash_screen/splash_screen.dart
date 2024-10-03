import 'package:flutter/material.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!context.mounted) return;
      context.go('/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: kColBlack),
        child: Center(
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              // TODO: maybe hero animation
              'assets/images/pokeball_logo_white.png',
            ),
          ),
        ),
      ),
    );
  }
}
