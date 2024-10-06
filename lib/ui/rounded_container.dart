import 'package:flutter/material.dart';

const roundedContainerPadding = EdgeInsets.fromLTRB(15, 11, 15, 11);

class RoundedContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? linearGradientColor1;
  final Color? linearGradientColor2;
  final EdgeInsets? padding;
  final String? backgroundImage;
  final bool hasShadow;
  final bool clipped;

  const RoundedContainer({
    super.key,
    this.child,
    this.padding = const EdgeInsets.fromLTRB(15, 11, 15, 11),
    this.color,
    this.linearGradientColor1,
    this.linearGradientColor2,
    this.margin,
    this.backgroundImage,
    this.hasShadow = false,
    this.clipped = true,
  }) : assert(linearGradientColor1 != null && linearGradientColor2 != null ||
            linearGradientColor1 == null && linearGradientColor2 == null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      clipBehavior: clipped ? Clip.hardEdge : Clip.none,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        boxShadow: [
          if (hasShadow)
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
        ],
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: child != null
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      )
                    : null,
              )
            : null,
        gradient: linearGradientColor1 != null && linearGradientColor2 != null
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [linearGradientColor1!, linearGradientColor2!],
              )
            : null,
      ),
      child: child,
    );
  }
}

class RoundedButton extends StatelessWidget {
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? linearGradientColor1;
  final Color? linearGradientColor2;
  final EdgeInsets? padding;
  final VoidCallback onTap;
  final Widget? child;
  final String? backgroundImage;
  final bool clipped;

  const RoundedButton({
    super.key,
    this.padding = roundedContainerPadding,
    this.color,
    this.backgroundImage,
    this.margin,
    required this.onTap,
    this.child,
    this.linearGradientColor1,
    this.linearGradientColor2,
    this.clipped = true,
  }) : assert(linearGradientColor1 != null && linearGradientColor2 != null ||
            linearGradientColor1 == null && linearGradientColor2 == null);

  @override
  Widget build(BuildContext context) {
    if (linearGradientColor1 != null) {
      return RoundedContainer(
        linearGradientColor1: linearGradientColor1,
        linearGradientColor2: linearGradientColor2,
        margin: margin,
        padding: const EdgeInsets.all(0),
        clipped: clipped,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: linearGradientColor1,
            onTap: onTap,
            child: Padding(
              padding: padding ?? roundedContainerPadding,
              child: child,
            ),
          ),
        ),
      );
    }

    return RoundedContainer(
      color: color,
      linearGradientColor1: linearGradientColor1,
      linearGradientColor2: linearGradientColor2,
      backgroundImage: backgroundImage,
      margin: margin,
      padding: const EdgeInsets.all(0),
      clipped: clipped,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: linearGradientColor1,
          onTap: onTap,
          child: Padding(
            padding: padding ?? roundedContainerPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}
