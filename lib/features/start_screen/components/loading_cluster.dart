import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/app_assets/app_assets.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:lottie/lottie.dart';

class LoadingCluster extends StatefulWidget {
  const LoadingCluster({super.key});

  @override
  LoadingClusterState createState() => LoadingClusterState();
}

class LoadingClusterState extends State<LoadingCluster> {
  late String currentLottieAsset;
  final String initialLottieAsset = AppAssets.appLoader;
  bool clusterLoaded = false;

  @override
  void initState() {
    super.initState();
    currentLottieAsset = AppAssets.appLoader;
    Timer(Duration(seconds: 5), () {
      setState(() {
        clusterLoaded = true;
        Future.delayed(Duration(seconds: 3), () {
          GoRouter.of(context).pop();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.3,
      key: ValueKey('loadingContent'),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: clusterLoaded == false
                  ? Lottie.asset(
                      width: MediaQuery.of(context).size.width * 0.125,
                      height: MediaQuery.of(context).size.height * 0.125,
                      currentLottieAsset,
                    )
                  : Icon(
                      size: 60,
                      Icons.check_circle,
                      color: AppColors.mintGreen.withAlpha(180),
                    )),
          SizedBox(height: 16),
          Text(
            clusterLoaded
                ? 'Cluster Successfully Connected'
                : 'Connecting your cluster ...',
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
