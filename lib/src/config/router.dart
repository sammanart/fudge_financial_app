import 'package:flutter/material.dart';
import 'package:fudge_financial_app/src/presentation/home/home.dart';
import 'package:fudge_financial_app/src/presentation/save_cards/save_cards.dart';

/// Holds app routing logic and constants
class Routes {
  static const home = '/';
  static const savedCards = '/savedCards';

  static PageRouteBuilder<void> onGenerateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      Routes.home: (context) => Home(),
      Routes.savedCards: (context) => SavedCards(),
    };

    final builder = routes[settings.name] ?? routes.values.first;
    return PageRouteBuilder<void>(
      settings: settings,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      pageBuilder: (context, animation, secondaryAnimation) {
        return builder(context);
      },
    );
  }
}
