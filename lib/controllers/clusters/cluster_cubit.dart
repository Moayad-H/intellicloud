import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/clusters/cluster_states.dart';
import 'package:intellicloud/data/models/cluster_data_model.dart';
import 'package:intellicloud/network/api_service.dart';

class ClusterCubit extends Cubit<ClusterState> {
  ClusterCubit() : super(ClusterInitial());
  final ApiService _apiService = ApiService();
  late Future<Cluster> cluster;
  void loadClusters() async {
    try {
      emit(ClusterLoading());
      // Simulate a network call
      await Future.delayed(Duration(seconds: 2));
      cluster = _apiService.getClusterById(1).then(
        (value) {
          log('Cluster loaded: $value');
          emit(ClusterLoaded(value));
          return value;
        },
      );
    } catch (e) {
      emit(ClusterError('Failed to load clusters'));
    }
  }
}
