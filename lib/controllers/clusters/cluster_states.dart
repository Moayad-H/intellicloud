import 'package:intellicloud/data/models/cluster_data_model.dart';

abstract class ClusterState {
  const ClusterState();
}

class ClusterInitial extends ClusterState {}

class ClusterLoading extends ClusterState {}

class ClusterLoaded extends ClusterState {
  final Cluster cluster;
  const ClusterLoaded(this.cluster);
}

class ClusterError extends ClusterState {
  final String message;

  const ClusterError(this.message);
}
