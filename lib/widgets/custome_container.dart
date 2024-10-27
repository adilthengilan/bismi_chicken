import 'package:flutter/material.dart';

class custom_Container extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final List<Color>? gradiantColors;
  final BoxBorder? border;
  final bool boxShadow;
  final DecorationImage? image;
  final BoxShape? boxShape;
  final Widget? child;
  const custom_Container({
    this.height,
    this.width,
    required this.boxShadow,
    this.gradiantColors,
    this.borderRadius,
    this.color,
    this.border,
    this.boxShape,
    this.child,
    this.padding,
    this.image,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
        border: border,
        shape: boxShape ?? BoxShape.rectangle,
        image: image,
        gradient: gradiantColors != null
            ? LinearGradient(colors: gradiantColors!)
            : null,
        boxShadow: boxShadow
            ? [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
