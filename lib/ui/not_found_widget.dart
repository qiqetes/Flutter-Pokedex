import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key, this.onRetryPressed});
  final VoidCallback? onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 5,
          child: Image.asset(
            "assets/images/MissingNo.png",
            width: 500,
            filterQuality: FilterQuality.none,
          ),
        ),
        const Text("MissingNo.", style: TextStyle(fontSize: 24)),
        if (onRetryPressed != null)
          ElevatedButton(onPressed: onRetryPressed!, child: const Text("Retry"))
      ],
    ));
  }
}
