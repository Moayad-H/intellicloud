import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/features/authentication/auth_screen.dart';
import 'package:intellicloud/features/cluster/available_savings/available_savings.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/cluster_dashboard.dart';
import 'package:intellicloud/features/costSavings/view/energy_consumption_screen.dart';
import 'package:intellicloud/mainScreen/view/main_layout.dart';
import 'package:intellicloud/features/start_screen/start_screen.dart';
import 'package:intellicloud/utils/custom_transition.dart';

class AppRoutes {
  static const String startScreen = '/';
  static const String authScreen = '/authentication';
  static const String otpVerificationScreen =
      '/authentication/otp/verification';
  static const String clusterDashboard = '/cluster/dashboard';
  static const String energyConsumption = '/energy_consumption';
  static const String analytics = '/analytics';
  static const String reports = '/reports';
  static const String availableSavings = '/cluster/available_savings';
  static const String settings = '/settings';
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: startScreen,
    routes: [
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          builder: (context, state, child) => MainLayout(
                child: child,
              ),
          routes: [
            GoRoute(
                path: authScreen,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: Container(),
                    )),

            GoRoute(
                path: startScreen,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: StartScreen(),
                    )),
            GoRoute(
                path: clusterDashboard,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: ClusterDashboard(),
                    )),
            GoRoute(
                path: availableSavings,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: AvailableSavings(),
                    )),
            GoRoute(
                path: energyConsumption,
                parentNavigatorKey: shellNavigatorKey,
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
