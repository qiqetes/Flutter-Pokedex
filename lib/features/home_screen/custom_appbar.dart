import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/pokemon/providers/captured_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class CustomAppBar extends ConsumerStatefulWidget {
  const CustomAppBar(
      {super.key, this.isShrink = false, required this.textEditingController});
  final bool isShrink;
  final TextEditingController textEditingController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final pokeType = ref.watch(predominantTypeProvider);
    final backgroundColor = pokeType.color;
    final textColor = pokeType.color.isDark ? kColWhite : kColBlack;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      width: double.infinity,
      height: 175,
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pokedex",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: textColor)),
                  if (!widget.isShrink) const SizedBox(height: 10),
                  if (!widget.isShrink)
                    _SearchInputField(
                        textEditingController: widget.textEditingController),
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
