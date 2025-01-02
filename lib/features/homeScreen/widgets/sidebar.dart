import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/assets/colors.dart';
import 'package:intellicloud/routes/app_routes.dart';

class SidebarNavigation extends StatelessWidget {
  final String activeRoute;

  const SidebarNavigation({Key? key, required this.activeRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
            isActive: activeRoute == AppRoutes.dashboard,
          ),
          _buildMenuItem(
            context,
            title: 'Analytics',
            route: AppRoutes.analytics,
            isActive: activeRoute == AppRoutes.analytics,
          ),
          _buildMenuItem(
            context,
            title: 'Reports',
            route: AppRoutes.reports,
            isActive: activeRoute == AppRoutes.reports,
          ),
          _buildMenuItem(
            context,
            title: 'Settings',
            route: AppRoutes.settings,
            isActive: activeRoute == AppRoutes.settings,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String title,
    required String route,
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
          GoRouter.of(context).pushReplacementNamed(route);
        }
      },
    );
  }
}
