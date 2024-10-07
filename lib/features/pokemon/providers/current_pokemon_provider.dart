import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/models/pokemon.dart';

final currentPokemonProvider = StateProvider<Pokemon?>((ref) => null);
