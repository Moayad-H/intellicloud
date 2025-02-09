import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';
import 'package:intellicloud/controllers/clusters/cluster_cubit.dart';
import 'package:intellicloud/controllers/nodes/nodes_cubit.dart';
import 'package:intellicloud/controllers/page_controller/page_cubit.dart';
import 'package:intellicloud/network/api_service.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/theme.dart';
import 'controllers/home_screen/dashboard_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => DashboardCubit()),
    BlocProvider(create: (_) => PageCubit()),
    BlocProvider(create: (_) => ClusterCubit()),
    BlocProvider(create: (_) => NodeCubit()),
    BlocProvider(create: (context) => AuthCubit()..checkAuthStatus()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    ApiService.initialize();
    log("DioHelper initialized");
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes().router,
      title: 'Flutter Demo',
      // darkTheme: getAppTheme(),
      darkTheme: getAppTheme().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
        scaffoldBackgroundColor: bgColor,
        primaryColor: greenColor,
        dialogBackgroundColor: secondaryColor,
        buttonTheme: ButtonThemeData(buttonColor: greenColor),
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      // theme: getLightTheme(),
      themeMode: ThemeMode.dark,
    );
  }
}
