import 'package:pokedex_flutter/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/splash_screen/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) => throw UnimplementedError());
void main() async {
  runApp(const SplashScreen());

  final prefs = await SharedPreferences.getInstance();
  await Future.delayed(const Duration(milliseconds: 1300));

  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const App(),
  ));
}
