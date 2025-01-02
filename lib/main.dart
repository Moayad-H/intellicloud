import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/theme.dart';
import 'features/homeScreen/controller/dashboard_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => DashboardCubit()), // Provide the DashboardCubit
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
      theme: getAppTheme(),
    );
  }
}
