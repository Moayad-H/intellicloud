import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/widgets/node_info_widget.dart';

class NodesInfo extends StatelessWidget {
  const NodesInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Nodes',
            maxLines: 1,
            minFontSize: 14,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.lightGray),
          ),
          SizedBox(
            height: 10,
          ),
          InfoCard(
            title: 'Total Nodes',
            mainValue: '50',
            subValues: [
              {'title': 'On-Demand', 'value': '40', 'color': 'primary'},
              {'title': 'Spot', 'value': '10', 'color': 'warning'},
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InfoCard(
            title: 'Total Pods',
            mainValue: '1500',
            subValues: [
              {'title': 'Scheduled', 'value': '1300', 'color': 'primary'},
              {'title': 'Unscheduled', 'value': '200', 'color': 'warning'},
            ],
          ),
        ],
      ),
    );
  }
}
