import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/features/authentication/auth_screen.dart';
import 'package:intellicloud/mainScreen/widgets/appbar.dart';
import 'package:intellicloud/mainScreen/widgets/sidebar2.dart';
import 'package:intellicloud/routes/app_routes.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key, required this.child});
  Widget child;

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardCubit>().loadMetrics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Sidebar2(),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(child: CustomAppbar()),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: widget.child,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Top Row for Key Metrics
              ],
            );
          } else {
            // GoRouter.of(context).go(AppRoutes.auth//Screen);
            return AuthScreen();
          }
        },
      ),
    );
  }

  //
}
