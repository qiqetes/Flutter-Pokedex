import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/features/home/custom_appbar.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
import 'package:pokedex_flutter/ui/responsive_grid.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 170 - MediaQuery.of(context).padding.top,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var top = constraints.biggest.height;
              bool isShrink = top < 160;

              return CustomAppBar(isShrink: isShrink);
            },
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
              child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ResponsiveGrid(
                  numColumns: 2,
                  spacing: 12,
                  children: PokeType.values.map((type) {
                    return _TypeBubble(type);
                  }).toList()),
            ),
          )),
        ),
      ],

      // SingleChildScrollView(
      //     child: SafeArea(
      //   top: false,
      //   child: Padding(
      //     padding: const EdgeInsets.all(12.0),
      //     child: ResponsiveGrid(
      //         numColumns: 2,
      //         spacing: 12,
      //         children: PokeType.values.map((type) {
      //           return _TypeBubble(type);
      //         }).toList()),
      //   ),
      // )),
    ));
  }
}

class _TypeBubble extends StatelessWidget {
  const _TypeBubble(this.type);
  final PokeType type;
  @override
  Widget build(BuildContext context) {
    bool lightText = type.secondaryColor.isDark;
    return RoundedButton(
      padding: EdgeInsets.zero,
      onTap: () => print(type.name),
      color: type.secondaryColor,
      // linearGradientColor1: type.secondaryColor,
      child: SizedBox(
          height: 73,
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
                    color: type.color,
                  )),
              Center(
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
