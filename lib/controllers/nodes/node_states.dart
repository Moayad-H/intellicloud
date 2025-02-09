import 'package:intellicloud/data/models/Node_data_model.dart';

abstract class NodesState {
  const NodesState();
}

class NodesInitial extends NodesState {}

class NodesLoading extends NodesState {}

class NodesLoaded extends NodesState {
  const NodesLoaded();
}

class NodesError extends NodesState {
  final String message;

  const NodesError(this.message);
}
