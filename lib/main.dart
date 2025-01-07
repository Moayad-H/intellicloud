import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/page_controller/page_cubit.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/theme.dart';
import 'controllers/home_screen/dashboard_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => DashboardCubit()), // Provide the DashboardCubit
    BlocProvider(create: (_) => PageCubit()), // Provide the PageCubit
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes().router,
      title: 'Flutter Demo',
      darkTheme: getAppTheme(),
      // theme: getLightTheme(),
      themeMode: ThemeMode.dark,
    );
  }
}
