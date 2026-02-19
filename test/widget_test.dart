import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/home_screen/custom_appbar.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';

void main() {
  testWidgets('CustomAppBar uses palette and shows search', (
    WidgetTester tester,
  ) async {
    const palette = PokedexPalette(primary: Colors.blue, secondary: Colors.red);
    final controller = TextEditingController();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [pokedexPaletteProvider.overrideWithValue(palette)],
        child: MaterialApp(
          home: Scaffold(body: CustomAppBar(textEditingController: controller)),
        ),
      ),
    );

    expect(find.text('Pokedex'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    final container = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer).first,
    );
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.blue);
  });
}
