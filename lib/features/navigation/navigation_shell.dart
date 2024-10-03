import 'package:flutter/material.dart';
import 'package:pokedex_flutter/features/navigation/bottom_gradient.dart';
import 'package:pokedex_flutter/features/navigation/nav_bar.dart';
import 'package:go_router/go_router.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.child});
  final Widget child;

  @override
  _NavigationShellState createState() => _NavigationShellState();
}

class _NavigationShellState extends State<NavigationShell> {
  int _currentIndex = 0;

  final List<String> _screenPaths = ["/home", "/stats", "/profile"];

  void onNavigate(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_screenPaths[index]);
  }

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: MaterialApp.createMaterialHeroController(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            widget.child,
            const BottomGradient(),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 0,
              child: SafeArea(
                child: NavBar(
                  selectedIndex: _currentIndex,
                  onNavigate: onNavigate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
