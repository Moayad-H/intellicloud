import 'package:flutter/material.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/theme.dart';
import 'package:intellicloud/features/homeScreen/view/starter_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes().router,
      title: 'Flutter Demo',
      theme: getAppTheme(),
    );
  }
}
