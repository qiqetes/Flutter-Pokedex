import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum PokeType {
  water(color: Color(0xff539ae2), secondaryColor: Color(0xff76baf0)),
  steel(color: Color(0xff89a1b0), secondaryColor: Color(0xffaabfc8)),
  rock(color: Color(0xffb2a061), secondaryColor: Color(0xffc9bb7c)),
  psychic(color: Color(0xffe5709b), secondaryColor: Color(0xfff691b4)),
  poison(color: Color(0xffb468b7), secondaryColor: Color(0xffce88cb)),
  normal(color: Color(0xffaab09f), secondaryColor: Color(0xffc6c9bb)),
  ice(color: Color(0xff70cbd4), secondaryColor: Color(0xff94e3e8)),
  ground(color: Color(0xffcc9f4f), secondaryColor: Color(0xffe3bd6a)),
  grass(color: Color(0xff71c558), secondaryColor: Color(0xff93dc74)),
  ghost(color: Color(0xff846ab6), secondaryColor: Color(0xff9c88cd)),
  fire(color: Color(0xffea7a3c), secondaryColor: Color(0xfff89d5d)),
  fighting(color: Color(0xffcb5f48), secondaryColor: Color(0xffe07f65)),
  fairy(color: Color(0xffe397d1), secondaryColor: Color(0xfff5bbea)),
  electric(color: Color(0xffe5c531), secondaryColor: Color(0xfff8de58)),
  dragon(color: Color(0xff6a7baf), secondaryColor: Color(0xff7f99cc)),
  dark(color: Color(0xff736c75), secondaryColor: Color(0xff8d878d)),
  bug(color: Color(0xff94bc4a), secondaryColor: Color(0xffb4d469)),
  flying(color: Color(0xff7da6de), secondaryColor: Color(0xff9dc2f0));

  final Color color;
  final Color secondaryColor;

  const PokeType({
    required this.color,
    required this.secondaryColor,
  });

  static PokeType fromJson(String type) {
    return PokeType.values
            .firstWhereOrNull((element) => element.toString() == type) ??
        PokeType.normal;
  }

  static PokeType fromResource(Map<String, Map<String, String>> json) {
    final typeStr = json['pokemon_v2_type']?['name'];
    return PokeType.values
            .firstWhereOrNull((element) => element.name == typeStr) ??
        PokeType.normal;
  }
}
