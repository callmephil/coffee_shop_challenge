import 'package:flutter/material.dart';

/// A Custom Grid to avoid dealing with Aspect Ratio of GridViews
class CustomGrid extends StatelessWidget {
  const CustomGrid({
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    this.controller,
    required this.children,
  });
  final List<Widget> children;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: crossAxisSpacing,
          vertical: mainAxisSpacing,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < children.length; i += crossAxisCount)
              Row(
                children: [
                  for (int j = i; j < i + crossAxisCount; j++)
                    if (j < children.length) // Add this condition
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: crossAxisSpacing / 2,
                            vertical: mainAxisSpacing / 2,
                          ),
                          child: children[j],
                        ),
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
