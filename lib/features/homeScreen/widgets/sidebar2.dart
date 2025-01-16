import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/routes/app_routes.dart';

class Sidebar2 extends StatefulWidget {
  Sidebar2({super.key});

  @override
  State<Sidebar2> createState() => _Sidebar2State();
}

class _Sidebar2State extends State<Sidebar2> {
  bool hideLogo = false;
  SideMenuDisplayMode currentMode = SideMenuDisplayMode.auto;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DashboardCubit>().loadActiveTabIndex();
  }

  @override
  Widget build(BuildContext context) {
    DashboardCubit dashboardCubit = DashboardCubit.get(context);

    List items = [
      SideMenuItem(
        title: 'Cluster List',
        onTap: (index, _) {
          // sideMenu.changePage(index);
          dashboardCubit.updateActiveTab(index);
          context.go(AppRoutes.startScreen);
        },
        icon: Icon(Icons.home),
        badgeContent: Text(
          '3',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      SideMenuExpansionItem(
        title: ' Cluster',
        icon: Icon(
          Icons.cloud,
          color: AppColors.brightWhite,
        ),
        children: [
          SideMenuItem(
            title: 'Dashboard',
            onTap: (index, _) {
              dashboardCubit.updateActiveTab(index);
              context.go(AppRoutes.clusterDashboard);
            },
            icon: const Icon(Icons.speed),
          ),
          SideMenuItem(
            title: 'Cost Monitoring',
            onTap: (index, _) {
              dashboardCubit.updateActiveTab(index);
            },
            icon: const Icon(Icons.bar_chart),
          ),
          SideMenuItem(
            title: 'Available Savings',
            onTap: (index, _) {
              dashboardCubit.updateActiveTab(index);
            },
            icon: Icon(Icons.monetization_on_sharp),
          )
        ],
      ),
      // SideMenuItem(
      //   title: 'Optimization',
      //   onTap: (index, _) {
      //     dashboardCubit.updateActiveTab(index);
      //     context.go(AppRoutes.energyConsumption);
      //   },
      //   icon: Icon(Icons.build_sharp),
      // ),
      // SideMenuItem(
      //   title: 'Savings',
      //   onTap: (index, _) {
      //     dashboardCubit.updateActiveTab(index);
      //     context.go(AppRoutes.energyConsumption);
      //   },
      //   icon: Icon(Icons.monetization_on_sharp),
      // ),
      SideMenuItem(
        title: 'Settings',
        onTap: (index, _) {
          dashboardCubit.updateActiveTab(index);
          context.go(AppRoutes.energyConsumption);
        },
        icon: Icon(Icons.settings),
      ),
    ];
    return SideMenu(
      displayModeToggleDuration: Duration(milliseconds: 350),
      style: SideMenuStyle(
        openSideMenuWidth: 250,
        displayMode: SideMenuDisplayMode.auto,
        hoverColor: AppColors.mintGreen.withAlpha(30),
        selectedColor: AppColors.mintGreen.withAlpha(80),
        selectedTitleTextStyle: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
                color: AppColors.brightWhite, fontWeight: FontWeight.w900),
        selectedIconColor: AppColors.mintGreen,
        unselectedIconColor: AppColors.lightGray,
        unselectedTitleTextStyle: Theme.of(context).textTheme.titleSmall,
        showHamburger: false,
        arrowCollapse: AppColors.mintGreen,
        arrowOpen: AppColors.mintGreen.withAlpha(140),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),

        backgroundColor: secondaryColor,
        selectedIconColorExpandable: AppColors.mintGreen,
        unselectedIconColorExpandable: AppColors.lightGray,
        // backgroundColor: AppColors.deepBlue.withAlpha(180),
        // openSideMenuWidth: 200
      ),
      // Page controller to manage a PageView
      controller: dashboardCubit.controller,
      // Will shows on top of all items, it can be a logo or a Title text
      title: MediaQuery.of(context).size.width > 600
          ? hideLogo == true
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      width: 80,
                      height: 80,
                      AppAssets.intelliCloudLogo,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'IntelliCloud',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.mintGreen,
                              ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
          : Container(),

      // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open

      // Notify when display mode changed
      onDisplayModeChanged: (mode) {
        if (currentMode != mode) {
          currentMode = mode;
          Future.delayed(Duration(milliseconds: 350), () {
            print(mode);
            setState(() {
              mode == SideMenuDisplayMode.compact
                  ? hideLogo = true
                  : hideLogo = false;
            });
          });
        }
      },
      // List of SideMenuItem to show them on SideMenu
      items: items,
    );
  }
}
