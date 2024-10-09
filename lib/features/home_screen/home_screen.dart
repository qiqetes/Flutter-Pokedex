import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_flutter/features/home_screen/custom_appbar.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_list.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokemon_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';
import 'package:pokedex_flutter/ui/not_found_widget.dart';
import 'package:pokedex_flutter/ui/responsive_grid.dart';
import 'package:pokedex_flutter/ui/rounded_container.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() => searchText = searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 175 - MediaQuery.of(context).padding.top,
          floating: false,
          pinned: true,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              var top = constraints.biggest.height;
              bool isShrink = top < 170;

              return CustomAppBar(
                isShrink: isShrink,
                textEditingController: searchController,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
            child: searchText.isEmpty
                ? const _TypesList()
                : Consumer(
                    builder: (context, ref, child) {
                      final res = ref.watch(
                          pokemonControllerProvider(searchName: searchText));
                      switch (res) {
                        case AsyncError():
                          return const Center(child: NotFoundWidget());
                        case AsyncData(:final value):
                          return PokemonList(pokemons: value);
                        case AsyncLoading(:final List<Pokemon> value):
                          return PokemonList(pokemons: value);
                        default:
                          return const Center(
                              child: CircularProgressIndicator());
                      }
                    },
                  )),
      ],
    ));
  }
}

class _TypesList extends StatelessWidget {
  const _TypesList();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final numColumns = max(screenWidth ~/ 350, 1);

    return SingleChildScrollView(
        child: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ResponsiveGrid(
            numColumns: numColumns,
            spacingHorizontal: 12,
            children: PokeType.values.map((type) {
              return _TypeBubble(type);
            }).toList()),
      ),
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
      onTap: () => context.push('/type/${type.name}'),
      color: type.secondaryColor,
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
                    // placeholderBuilder: (context) => const CircularProgressIndicator(),z
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
