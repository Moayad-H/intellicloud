import 'package:flutter/material.dart';
import 'package:intellicloud/features/cluster/dashboard/components/cluster_info.dart';
import 'package:intellicloud/features/cluster/dashboard/components/nodes_info.dart';

class ClusterDetailsComponent extends StatefulWidget {
  const ClusterDetailsComponent({super.key});

  @override
  State<ClusterDetailsComponent> createState() =>
      _ClusterDetailsComponentState();
}

class _ClusterDetailsComponentState extends State<ClusterDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClusterInfoWidget(),
        SizedBox(
          width: 20,
        ),
        NodesInfo(),
      ],
    );
  }
}
