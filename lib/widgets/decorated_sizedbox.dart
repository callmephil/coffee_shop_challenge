import 'package:flutter/material.dart';

class DecoratedSizedBox extends StatelessWidget {
  const DecoratedSizedBox({
    super.key,
    required this.decoration,
    required this.size,
    this.child,
  });

  final BoxDecoration decoration;
  final Size size;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: DecoratedBox(
        decoration: decoration,
        child: child,
      ),
    );
  }
}
