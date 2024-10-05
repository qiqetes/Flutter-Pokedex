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
    final MediaQueryData mqd = MediaQuery.of(context);
    final MediaQueryData newMqd = mqd.copyWith(
        padding: mqd.padding.copyWith(bottom: 80),
        viewPadding: mqd.viewPadding.copyWith(bottom: 80));

    return HeroControllerScope(
      controller: MaterialApp.createMaterialHeroController(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Builder(builder: (context) {
              return MediaQuery(data: newMqd, child: widget.child);
            }),
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
    // // return Container(color: Colors.pink);
    // final prevMediaQuery = MediaQuery.of(context);
    // final newMediaQueryData = prevMediaQuery.copyWith(
    //     padding: prevMediaQuery.padding.copyWith(bottom: 50),
    //     viewPadding: prevMediaQuery.viewPadding.copyWith(bottom: 50));
    // return SafeArea(
    //     child: Container(
    //   color: Colors.pink,
    //   child: Builder(builder: (context) {
    //     // final newMediaQueryData = MediaQuery.of(context).copyWith(
    //     //     padding: const EdgeInsets.only(bottom: 0),
    //     //     viewPadding: const EdgeInsets.only(bottom: 50));
    //     return MediaQuery(data: newMediaQueryData, child: widget.child);
    //   }),
    // ));
  }
}
