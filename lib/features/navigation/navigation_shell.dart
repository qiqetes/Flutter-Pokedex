import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_flutter/features/navigation/bottom_gradient.dart';
import 'package:pokedex_flutter/features/navigation/nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_flutter/features/pokemon/providers/pokedex_palette_provider.dart';
import 'package:pokedex_flutter/ui/k_colors.dart';

class NavigationShell extends StatefulWidget {
  const NavigationShell({super.key, required this.child});
  final Widget child;

  @override
  NavigationShellState createState() => NavigationShellState();
}

class NavigationShellState extends State<NavigationShell> {
  int _currentIndex = 0;

  final List<String> _screenPaths = ["/", "/captured"];

  void onNavigate(int index) {
    setState(() {
      _currentIndex = index;
    });
    context.go(_screenPaths[index]);
  }

  @override
  Widget build(BuildContext context) {
    final isBigScreen = MediaQuery.sizeOf(context).width > 600;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: isBigScreen
          ? _DesktopLayout(
              onNavigate: onNavigate,
              selectedIndex: _currentIndex,
              child: widget.child,
            )
          : _AppLayout(
              onNavigate: onNavigate,
              selectedIndex: _currentIndex,
              child: widget.child,
            ),
    );
  }
}

class _DesktopLayout extends ConsumerWidget {
  const _DesktopLayout({
    required this.child,
    required this.onNavigate,
    required this.selectedIndex,
  });
  final Widget child;
  final void Function(int) onNavigate;
  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = ref.watch(pokedexPaletteProvider);
    return Row(
      children: [
        NavigationRail(
          backgroundColor: kColBlack,
          selectedIndex: selectedIndex,
          onDestinationSelected: onNavigate,
          labelType: NavigationRailLabelType.all,
          destinations: [
            NavigationRailDestination(
              icon: Icon(
                Icons.search,
                color: selectedIndex == 0 ? palette.primary : kColWhite,
              ),
              label: const Text('Home'),
            ),
            NavigationRailDestination(
              icon: Image.asset(
                'assets/images/pokeball_logo_white.png',
                width: 24,
                color: selectedIndex == 1 ? palette.primary : kColWhite,
              ),
              label: const Text('Captured'),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: child),
      ],
    );
  }
}

class _AppLayout extends StatelessWidget {
  const _AppLayout({
    required this.child,
    required this.onNavigate,
    required this.selectedIndex,
  });
  final Widget child;
  final void Function(int) onNavigate;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mqd = MediaQuery.of(context);
    final MediaQueryData newMqd = mqd.copyWith(
      padding: mqd.padding.copyWith(bottom: 80 + mqd.padding.bottom),
      viewPadding: mqd.viewPadding.copyWith(
        bottom: 80 + mqd.viewPadding.bottom,
      ),
    );

    return Stack(
      children: [
        Builder(
          builder: (context) {
            return MediaQuery(data: newMqd, child: child);
          },
        ),
        const BottomGradient(),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 0,
          child: SafeArea(
            child: NavBar(selectedIndex: selectedIndex, onNavigate: onNavigate),
          ),
        ),
      ],
    );
  }
}
