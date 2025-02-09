import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/features/authentication/auth_screen.dart';
import 'package:intellicloud/features/cluster/available_savings/available_savings.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/cluster_dashboard.dart';
import 'package:intellicloud/features/cluster/node_list/node_list_screen.dart';
import 'package:intellicloud/features/costSavings/view/energy_consumption_screen.dart';
import 'package:intellicloud/features/pdfViewer/pdf_viewer.dart';
import 'package:intellicloud/features/viewAccount/view_account.dart';
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
  static const String pdfViewer = '/pdfViewer';
  static const String reports = '/reports';
  static const String availableSavings = '/cluster/available_savings';
  static const String nodeList = '/cluster/node_list';
  static const String profile = '/view_account';
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
                path: nodeList,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: NodeListScreen(),
                    )),
            GoRoute(
                path: profile,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: ProfileScreen(),
                    )),
            GoRoute(
                path: energyConsumption,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) => buildPageWithSlideTransition(
                      child: EnergyConsumptionScreen(),
                    )),
            GoRoute(
                path: pdfViewer,
                parentNavigatorKey: shellNavigatorKey,
                pageBuilder: (context, state) {
                  String pdfPath = state.extra as String;

                  return buildPageWithSlideTransition(
                    child: PdfViewer(path: pdfPath),
                  );
                }),
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
