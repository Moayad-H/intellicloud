import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithSlideTransition(
    {required Widget child, Offset beginOffset = const Offset(1.0, 0.0)}) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const Curve curve = Curves.easeInOut;
      final Animatable<Offset> tween =
          Tween(begin: beginOffset, end: Offset.zero)
              .chain(CurveTween(curve: curve));
      final Animation<Offset> offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
