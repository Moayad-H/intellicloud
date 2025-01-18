import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intellicloud/data/models/cluster_data_model.dart';
import 'package:intellicloud/data/models/daily_compute_spend_model.dart';
import 'package:intellicloud/data/models/node_data_model.dart';
import 'package:intellicloud/data/models/pod_data_model.dart';
import 'package:intellicloud/network/api_endpoints.dart';

class ApiService {
  static late final Dio _dio;

  static void initialize() {
    _dio = Dio(
      BaseOptions(
        followRedirects: true,
        baseUrl: APIEndpoints.baseURL, // Replace with your server URL
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
        headers: <String, dynamic>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        receiveDataWhenStatusError: true,
        validateStatus: (int? state) => state! < 500,

        contentType: 'application/json',
      ),
    );

    _dio.interceptors.addAll([
      LogInterceptor(
        responseBody: true,
        error: true,
        requestBody: true,
        requestHeader: true,
      ),
    ]);
  }

  // Fetch a cluster by ID
  Future<Cluster> getClusterById(int clusterId) async {
    try {
      final response = await _dio.get('clusters/$clusterId',
          options: Options(
            contentType: 'application/json',
            method: 'GET',
            validateStatus: (state) => state! < 500,
          ));

      log(response.data.toString());
      return Cluster.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch cluster: $e');
    }
  }

  // Fetch a node by ID
  Future<Node> getNodeById(int nodeId) async {
    try {
      final response = await _dio.get('nodes/$nodeId');
      return Node.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch node: $e');
    }
  }

  // Fetch all nodes for a cluster
  Future<List<Node>> getNodesByClusterId(int clusterId) async {
    try {
      final response = await _dio.get('clusters/$clusterId/nodes');
      return (response.data as List)
          .map((node) => Node.fromJson(node))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch nodes: $e');
    }
  }

  // Fetch a pod by ID
  Future<Pod> getPodById(int podId) async {
    try {
      final response = await _dio.get('pods/$podId');
      return Pod.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch pod: $e');
    }
  }

  // Fetch all pods for a cluster
  Future<List<Pod>> getPodsByClusterId(int clusterId) async {
    try {
      final response = await _dio.get('clusters/$clusterId/pods');
      return (response.data as List).map((pod) => Pod.fromJson(pod)).toList();
    } catch (e) {
      throw Exception('Failed to fetch pods: $e');
    }
  }

  // Fetch daily compute spend by ID
  Future<DailyComputeSpend> getDailyComputeSpendById(int spendId) async {
    try {
      final response = await _dio.get('daily-compute-spend/$spendId');
      return DailyComputeSpend.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch daily compute spend: $e');
    }
  }

  // Fetch all daily compute spend records for a cluster
  Future<List<DailyComputeSpend>> getDailyComputeSpendByClusterId(
      int clusterId) async {
    try {
      final response =
          await _dio.get('clusters/$clusterId/daily-compute-spend');
      return (response.data as List)
          .map((spend) => DailyComputeSpend.fromJson(spend))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch daily compute spend records: $e');
    }
  }
}
