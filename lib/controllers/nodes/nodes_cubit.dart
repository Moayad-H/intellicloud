import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/nodes/node_states.dart';
import 'package:intellicloud/data/models/node_data_model.dart';
import 'package:intellicloud/data/repositories/node_repo.dart';
import 'package:intellicloud/network/api_service.dart';

class NodeCubit extends Cubit<NodesState> {
  NodeCubit() : super(NodesInitial());

  List<Node>? nodes;
  final ApiService _apiService = ApiService();
  NodesRepository nodesRepository = NodesRepository();
  static NodeCubit get(context) => BlocProvider.of<NodeCubit>(context);
  Future<void> loadNodes() async {
    try {
      emit(NodesLoading());

      nodes = await _apiService.getAllNodes().then(
        (value) {
          log('Nodes loaded: $value');
          emit(NodesLoaded());
          return value;
        },
      );
    } catch (e) {
      log('Error loading nodes: $e');
      emit(NodesError('Failed to load nodes: ${e.toString()}'));
    }
  }
}
