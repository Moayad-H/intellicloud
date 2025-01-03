import 'package:go_router/go_router.dart';
import 'package:intellicloud/features/homeScreen/view/starter_dashboard.dart';
import 'package:intellicloud/features/settingsScreen/view/starter_dashboard.dart';

class AppRoutes {
  static const String dashboard = '/';
  static const String analytics = '/analytics';
  static const String reports = '/reports';
  static const String settings = '/settings';

  final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: dashboard,
    routes: [
      GoRoute(
        path: dashboard,
        builder: (context, state) => DashboardPage(),
      ),
      GoRoute(
        path: settings,
        builder: (context, state) => SettingsPage(),
      ),
    ],
  );
}
