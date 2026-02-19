import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon/components/pokemon_card.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';
import 'package:pokedex_flutter/ui/responsive_grid.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key, required this.pokemons, this.onReachListEnd});
  final List<Pokemon> pokemons;
  final VoidCallback? onReachListEnd;

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      refetchOnMaxScrollExtent();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      refetchOnMaxScrollExtent();
    });
  }

  void refetchOnMaxScrollExtent() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 20) {
      widget.onReachListEnd?.call();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _loadingIndicator() {
    return const SizedBox(height: 120, child: Center(child: CircularProgressIndicator()));
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.sizeOf(context).width;
    final elements = max(screenW ~/ 400, 2);

    return SingleChildScrollView(
      controller: _scrollController,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ResponsiveGrid(
                  numColumns: elements,
                  spacingHorizontal: 16,
                  spacingVertical: 0,
                  children: widget.pokemons.map((pokemon) => PokemonCard(pokemon)).toList()),
              if (widget.onReachListEnd != null) _loadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
