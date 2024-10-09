import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum PokeType {
  water(11, color: Color(0xff539ae2), secondaryColor: Color(0xff76baf0)),
  steel(9, color: Color(0xff89a1b0), secondaryColor: Color(0xffaabfc8)),
  rock(6, color: Color(0xffb2a061), secondaryColor: Color(0xffc9bb7c)),
  psychic(14, color: Color(0xffe5709b), secondaryColor: Color(0xfff691b4)),
  poison(4, color: Color(0xffb468b7), secondaryColor: Color(0xffce88cb)),
  normal(2, color: Color(0xffaab09f), secondaryColor: Color(0xffc6c9bb)),
  ice(15, color: Color(0xff70cbd4), secondaryColor: Color(0xff94e3e8)),
  ground(5, color: Color(0xffcc9f4f), secondaryColor: Color(0xffe3bd6a)),
  grass(12, color: Color(0xff71c558), secondaryColor: Color(0xff93dc74)),
  ghost(8, color: Color(0xff846ab6), secondaryColor: Color(0xff9c88cd)),
  fire(10, color: Color(0xffea7a3c), secondaryColor: Color(0xfff89d5d)),
  fighting(2, color: Color(0xffcb5f48), secondaryColor: Color(0xffe07f65)),
  fairy(18, color: Color(0xffe397d1), secondaryColor: Color(0xfff5bbea)),
  electric(13, color: Color(0xffe5c531), secondaryColor: Color(0xfff8de58)),
  dragon(16, color: Color(0xff6a7baf), secondaryColor: Color(0xff7f99cc)),
  dark(17, color: Color(0xff736c75), secondaryColor: Color(0xff8d878d)),
  bug(7, color: Color(0xff94bc4a), secondaryColor: Color(0xffb4d469)),
  flying(3, color: Color(0xff7da6de), secondaryColor: Color(0xff9dc2f0));

  final int typeId;
  final Color color;
  final Color secondaryColor;

  const PokeType(
    this.typeId, {
    required this.color,
    required this.secondaryColor,
  });

  static PokeType fromJson(String type) {
    return PokeType.values
            .firstWhereOrNull((element) => element.name == type) ??
        PokeType.normal;
  }

  static PokeType fromResource(Map<String, dynamic> json) {
    final typeStr = json['pokemon_v2_type']?['name'];
    return PokeType.values
            .firstWhereOrNull((element) => element.name == typeStr) ??
        PokeType.normal;
  }

  String get logoPath => 'assets/images/type_logos/${name}_icon.svg';
}
