import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/home/custom_appbar.dart';
import 'package:pokedex_flutter/models/poke_type.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(children: [
                ...PokeType.values.map((type) => RoundedButton(
                      margin:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      onTap: () => print(type.name),
                      linearGradientColor2: type.color,
                      linearGradientColor1: type.secondaryColor,
                      child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Text(type.name)),
                    )),
              ])),
            ),
          ],
        ));
  }
}
