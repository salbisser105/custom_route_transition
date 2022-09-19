library custom_route_transitions;

import 'package:flutter/material.dart';

/// Tipos de animaciones
enum AnimationType { normal, fadeIn }

/// Main class, [context] es el BuildContext de la aplicación en ese momento
/// [child] es el widget a navegar, [animation] es el tipo de animación
class CustomRouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  CustomRouteTransitions(
      {required this.context,
      required this.child,
      this.replacement = false,
      this.animation = AnimationType.normal,
      this.duration = const Duration(milliseconds: 300)}) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
    }
  }

  /// Push normal de la página
  void _pushPage(Route route) => Navigator.push(context, route);

  /// Push replacement de la página
  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  // Código de una transición normal
  void _normalTransition() {
    final route = MaterialPageRoute(builder: (_) => child);

    (replacement) ? _pushReplacementPage(route) : _pushPage(route);
  }

  /// Controlador de la transición con fadeIn
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (_, __, ___) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            child: child,
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          );
        });

    (replacement) ? _pushReplacementPage(route) : _pushPage(route);
  }
}
