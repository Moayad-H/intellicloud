import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/start_screen/components/loading_cluster.dart';

class ClusterConnectionScreen extends StatefulWidget {
  const ClusterConnectionScreen({super.key});

  @override
  ClusterConnectionScreenState createState() => ClusterConnectionScreenState();
}

class ClusterConnectionScreenState extends State<ClusterConnectionScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: _isLoading ? LoadingCluster() : _buildInitialContent(context),
      ),
    );
  }

  Widget _buildInitialContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900,
      ),
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.5,
      key: ValueKey('initialContent'),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Connect your cluster:',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.mintGreen.withAlpha(200),
                    ),
              ),
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          Text(
            'Make sure that kubectl is installed and that it can access your cluster. Copy the script and run it in your cloud shell or terminal.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade400,
                ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: AppColors.mintGreen.withAlpha(200),
                      child: TextButton.icon(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(
                              text:
                                  'curl -H "Authorization: Token 7545a68eee65b60c1904541c6bb21642eb1f0dcf82333e1ed1ce9be1cdc58f84" '
                                  '"https://api.intellicloud.ai/v1/agent.yaml?provider=eks" | kubectl apply -f -'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.teal,
                              content: Text(
                                'Script copied to clipboard!',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.copy, color: Colors.black),
                        label: Text(
                          'Copy to Clipboard',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SelectableText(
                  'curl -H "Authorization: Token 7545a68eee65b60c1904541c6bb21642eb1f0dcf82333e1ed1ce9be1cdc58f84" '
                  '"https://api.intellicloud.ai/v1/agent.yaml?provider=eks" | kubectl apply -f -',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 18.0,
                    color: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.mintGreen.withAlpha(200),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
              },
              child: Text(
                'I Ran The Script',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
