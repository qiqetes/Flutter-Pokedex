import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/home/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppbar(),
            Expanded(
              child: Center(
                child: Text("Home Screen"),
              ),
            ),
          ],
        ));
  }
}
