import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/assets/colors.dart';
import 'package:intellicloud/features/homeScreen/controller/dashboard_cubit.dart';
import 'package:intellicloud/routes/app_routes.dart';

class SidebarNavigation extends StatelessWidget {
  final String activeRoute;

  const SidebarNavigation({Key? key, required this.activeRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) => ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Dashboard Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildMenuItem(
              context,
              title: 'Dashboard',
              route: AppRoutes.dashboard,
              index: 0,
              isActive: state.activeTabIndex == 0,
            ),
            _buildMenuItem(
              context,
              title: 'Analytics',
              route: AppRoutes.analytics,
              index: 1,
              isActive: state.activeTabIndex == 1,
            ),
            _buildMenuItem(
              context,
              title: 'Reports',
              route: AppRoutes.reports,
              index: 2,
              isActive: state.activeTabIndex == 2,
            ),
            _buildMenuItem(
              context,
              title: 'Settings',
              route: AppRoutes.settings,
              index: 3,
              isActive: state.activeTabIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required String route,
    required int index,
    required bool isActive,
  }) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: isActive == true
                ? AppColors.darkTealBlue
                : AppColors.brightWhite),
      ),
      onTap: () {
        if (route != activeRoute) {
          context.read<DashboardCubit>().updateActiveTab(index);
          GoRouter.of(context).push(route);
        }
      },
    );
  }
}
