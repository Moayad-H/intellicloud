import 'package:flutter/material.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:lottie/lottie.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Lottie.asset(
            width: MediaQuery.of(context).size.width * 0.125,
            height: MediaQuery.of(context).size.height * 0.125,
            AppAssets.appLoader,
          )
        ],
      ),
    );
  }
}
