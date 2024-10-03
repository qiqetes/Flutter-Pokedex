import 'package:flutter/material.dart';
import 'package:pokedex_flutter/router.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(context, ref) {
    final GoRouter goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'Climbing Pyramid',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: kColWhite,
          elevation: 0,
          iconTheme: IconThemeData(color: kColBlack),
          titleTextStyle: TextStyle(
            color: kColBlack,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        scaffoldBackgroundColor: kColWhite,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.dmSansTextTheme().copyWith(
          titleLarge: GoogleFonts.dmSansTextTheme()
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold, fontSize: 34),
          bodyMedium: GoogleFonts.dmSansTextTheme()
              .bodyMedium
              ?.copyWith(color: kColBlack),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(kColAccent),
            foregroundColor: WidgetStateProperty.all<Color>(kColBlack),
            textStyle: WidgetStateProperty.all<TextStyle>(
              GoogleFonts.dmSans().copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            ),
            maximumSize: WidgetStateProperty.all<Size>(
              const Size(double.infinity, 40),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
            gapPadding: 1,
          ),
          alignLabelWithHint: true,
          fillColor: kColSoft,
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 8),
        ),
      ),
    );
  }
}
