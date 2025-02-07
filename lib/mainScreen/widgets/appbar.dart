import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/authentication/auth_cubit.dart';

class CustomAppbar extends StatefulWidget {
  CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Profile Button');

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      //decoration: BoxDecoration(color: AppColors.brightWhite),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Documentation',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.lightGray),
            )),
        TextButton(
            onPressed: () {},
            child: Text(
              'API',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.lightGray),
            )),
        IconButton(
          icon: Icon(Icons.dark_mode),
          onPressed: () {
            // Notification action
          },
        ),
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Notification action
          },
        ),
        MenuAnchor(
            childFocusNode: _buttonFocusNode,
            style: MenuStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(secondaryColor),
            ),
            menuChildren: <Widget>[
              AnimatedContainer(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(8)),
                duration: Duration(seconds: 1),
                child: Column(
                  children: [
                    MenuItemButton(
                      leadingIcon: Icon(Icons.manage_accounts),
                      onPressed: () {},
                      child: const Text('View Account'),
                    ),
                    MenuItemButton(
                      leadingIcon: Icon(Icons.logout_outlined),
                      onPressed: () async {
                        await AuthCubit.get(context).logout();
                      },
                      child: const Text('Log Out'),
                    ),
                  ],
                ),
              )
            ],
            builder: (_, MenuController controller, Widget? child) {
              return IconButton(
                icon: Icon(Icons.account_circle),
                focusNode: _buttonFocusNode,
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
              );
            }),
      ]),
    );
  }
}
