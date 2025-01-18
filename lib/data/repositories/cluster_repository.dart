import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:intellicloud/app_repository.dart/repository.dart';
import 'package:intellicloud/data/models/cluster_data_model.dart';
import 'package:intellicloud/errors/exceptions.dart';
import 'package:intellicloud/network/api_endpoints.dart';

class ClusterRepository extends Repository {
  Future<Either<Failure, Cluster?>> getAllClusters() async {
    return await exceptionHandler(() async {
      Map<String, dynamic> response = await dioHelper.getData(
          url: APIEndpoints.getAllClusters, isVersion1: false, query: null);

      log(response.toString());
      if (response['status'].toString()[0] == '2') {
      } else {
        throw ServerException(exceptionMessage: response['msg']);
      }
    });
  }
}
