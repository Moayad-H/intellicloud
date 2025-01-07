import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/controllers/page_controller/page_state.dart';
import 'package:intellicloud/features/costSavings/view/energy_consumption_screen.dart';
import 'package:intellicloud/features/homeScreen/view/starter_dashboard.dart';
import 'package:intellicloud/features/settingsScreen/view/settings_screen.dart';
import 'package:intellicloud/features/start_screen/start_screen.dart';
import 'package:intellicloud/utils/custom_transition.dart';

class AppRoutes {
  static const String startScreen = '/';
  static const String energyConsumption = '/energy_consumption';
  static const String analytics = '/analytics';
  static const String reports = '/reports';
  static const String settings = '/settings';
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: startScreen,
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => DashboardPage(
                child: child,
              ),
          routes: [
            GoRoute(
                path: startScreen,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: StartScreen(),
                    )),
            GoRoute(
                path: energyConsumption,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: EnergyConsumptionScreen(),
                    )),
            // GoRoute(
            //   path: settings,
            //   parentNavigatorKey: _rootNavigatorKey,
            //   pageBuilder: (context, state) =>
            //       buildPageWithSlideTransition(child: SettingsPage()),
            // ),
          ])
    ],
  );
}
