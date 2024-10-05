import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/pokemon/models/poke_type.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class NavBar extends StatelessWidget {
  const NavBar(
      {super.key, required this.selectedIndex, required this.onNavigate});
  final int selectedIndex;
  final Function(int) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        // width: double.infinity,
        margin: const EdgeInsets.only(bottom: 8),
        height: 64,
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
        decoration: BoxDecoration(
          color: kColBlack,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavIcon(
              Icon(Icons.search,
                  size: 40,
                  color: selectedIndex == 0
                      ? PokeType.electric.color
                      : Colors.white),
              onPressed: () => onNavigate(0),
            ),
            _NavIcon(
              Image.asset('assets/images/pokeball_logo_white.png',
                  color: selectedIndex == 1
                      ? PokeType.electric.color
                      : Colors.white),
              onPressed: () => onNavigate(1),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO: remove
class _NavIcon extends StatelessWidget {
  const _NavIcon(
    this.icon, {
    required this.onPressed,
    // required this.isSelected,
  });
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );
  }
}
