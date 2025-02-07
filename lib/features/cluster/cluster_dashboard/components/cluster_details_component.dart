import 'package:flutter/material.dart';
import 'package:intellicloud/data/models/cluster_data_model.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/cluster_info.dart';
import 'package:intellicloud/features/cluster/cluster_dashboard/components/nodes_info.dart';

class ClusterDetailsComponent extends StatefulWidget {
  const ClusterDetailsComponent({super.key, required this.cluster});
  final Cluster cluster;

  @override
  State<ClusterDetailsComponent> createState() =>
      _ClusterDetailsComponentState();
}

class _ClusterDetailsComponentState extends State<ClusterDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClusterInfoWidget(
          cluster: widget.cluster,
        ),
        SizedBox(
          width: 20,
        ),
        NodesInfo(cluster: widget.cluster),
      ],
    );
  }
}
