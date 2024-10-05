import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pokeType = PokeType.water;
    final backgroundColor = pokeType.color;
    final textColor = pokeType.color.isDark ? kColWhite : kColBlack;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      width: double.infinity,
      height: 167,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -30,
            right: -20,
            child: Image.asset(
              'assets/images/pokeball_logo_white.png',
              color: pokeType.secondaryColor,
              width: 190,
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pokedex",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: textColor)),
                  const SizedBox(height: 10),
                  _SearchInputField(textEditingController: _controller),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SearchInputField extends StatelessWidget {
  const _SearchInputField({required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
        ),
        hintText: 'Search your pokemon',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      ),
    );
  }
}
