import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/app.dart';
import 'package:pokedex_flutter/features/home/custom_appbar.dart';
import 'package:pokedex_flutter/models/poke_type.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
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
                ...PokeType.values.map((type) => _TypeBubble(type)),
              ])),
            ),
          ],
        ));
  }
}

class _TypeBubble extends StatelessWidget {
  const _TypeBubble(this.type);
  final PokeType type;
  @override
  Widget build(BuildContext context) {
    bool lightText = type.color.isDark;
    return RoundedButton(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      padding: EdgeInsets.zero,
      onTap: () => print(type.name),
      linearGradientColor2: type.color,
      linearGradientColor1: type.secondaryColor,
      child: SizedBox(
          height: 100,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                  top: -10,
                  right: -10,
                  child: SvgPicture.asset(
                    "assets/images/type_logos/${type.name}_icon.svg",
                    height: 100,
                    width: 100,
                    color: type.secondaryColor,
                  )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  type.name.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: lightText ? Colors.white : Colors.black,
                      ),
                ),
              ),
            ],
          )),
    );
  }
}
