import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtensions on BuildContext {
  void popOr({VoidCallback? orElse}) {
    if (canPop()) {
      pop();
    } else {
      orElse?.call();
    }
  }
}
