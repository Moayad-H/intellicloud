import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intellicloud/app_repository.dart/repository.dart';
import 'package:intellicloud/data/models/node_data_model.dart';
import 'package:intellicloud/errors/exceptions.dart';
import 'package:intellicloud/network/api_endpoints.dart';

class NodesRepository extends Repository {
  Future<Either<Failure, List<Node>?>> getAllNodes() async {
    return await exceptionHandler(() async {
      final response = await dioHelper.getData(
        url: APIEndpoints.getAllNodes,
        isVersion1: false,
        query: null,
      );

      if (response != null) {
        try {
          final List<dynamic> nodesData = response as List<dynamic>;
          final List<Node> nodes = nodesData
              .map(
                  (nodeJson) => Node.fromJson(nodeJson as Map<String, dynamic>))
              .toList();

          return nodes;
        } catch (e) {
          throw Exception('Failed to parse nodes: ${e.toString()}');
        }
      } else {
        throw ServerException(
          exceptionMessage: response?['msg'] ?? 'Failed to fetch nodes',
        );
      }
    });
  }
}
