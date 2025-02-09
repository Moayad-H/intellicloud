// class Node {
//   final int id;
//   final int clusterId;
//   final String name;
//   final String type;
//   final double cpuCapacity;
//   final double memoryCapacity;
//   final double cpuUsed;
//   final double memoryUsed;
//   final double instanceCostPerHour;
//   final double cpuCostPerHour;

//   Node({
//     required this.id,
//     required this.clusterId,
//     required this.name,
//     required this.type,
//     required this.cpuCapacity,
//     required this.memoryCapacity,
//     required this.cpuUsed,
//     required this.memoryUsed,
//     required this.instanceCostPerHour,
//     required this.cpuCostPerHour,
//   });

//   factory Node.fromJson(Map<String, dynamic> json) {
//     return Node(
//       id: json['id'],
//       clusterId: json['cluster_id'],
//       name: json['name'],
//       type: json['type'],
//       cpuCapacity: (json['cpu_capacity'] as num).toDouble(),
//       memoryCapacity: (json['memory_capacity'] as num).toDouble(),
//       cpuUsed: (json['cpu_used'] as num).toDouble(),
//       memoryUsed: (json['memory_used'] as num).toDouble(),
//       instanceCostPerHour: (json['instance_cost_per_hour'] as num).toDouble(),
//       cpuCostPerHour: (json['cpu_cost_per_hour'] as num).toDouble(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'cluster_id': clusterId,
//       'name': name,
//       'type': type,
//       'cpu_capacity': cpuCapacity,
//       'memory_capacity': memoryCapacity,
//       'cpu_used': cpuUsed,
//       'memory_used': memoryUsed,
//       'instance_cost_per_hour': instanceCostPerHour,
//       'cpu_cost_per_hour': cpuCostPerHour,
//     };
//   }
// }

import 'package:intellicloud/utils/gmt_parser.dart';

class Node {
  final int? id;
  final int clusterId;
  final String name;
  final double cpuCostRate;
  final double memoryCostRate;
  final DateTime createdAt;
  final NodeType nodeType;

  Node({
    this.id,
    required this.clusterId,
    required this.name,
    required this.cpuCostRate,
    required this.memoryCostRate,
    required this.createdAt,
    required this.nodeType,
  });
  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json['id'] as int?,
        clusterId: json['cluster_id'] as int,
        name: json['name'] as String,
        cpuCostRate: (json['cpu_cost_rate'] as num).toDouble(),
        memoryCostRate: (json['memory_cost_rate'] as num).toDouble(),
        createdAt: parseGmtDate(json['created_at'] as String),
        nodeType: NodeType.fromJson(json['node_type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cluster_id': clusterId,
        'name': name,
        'cpu_cost_rate': cpuCostRate,
        'memory_cost_rate': memoryCostRate,
        'created_at': createdAt.toIso8601String(),
        'node_type': nodeType.toJson(),
      };
}

class NodeType {
  final int? id;
  final String name;
  final double vcpu;
  final double ramSize;
  final double cpuCostRateMin;
  final double cpuCostRateMax;
  final double ramCostRateMin;
  final double ramCostRateMax;
  final double bandwidth;
  final String powerModel;

  NodeType({
    this.id,
    required this.name,
    required this.vcpu,
    required this.ramSize,
    required this.cpuCostRateMin,
    required this.cpuCostRateMax,
    required this.ramCostRateMin,
    required this.ramCostRateMax,
    required this.bandwidth,
    required this.powerModel,
  });

  factory NodeType.fromJson(Map<String, dynamic> json) => NodeType(
        id: json['id'] as int?,
        name: json['name'] as String,
        vcpu: (json['vcpu'] as num).toDouble(),
        ramSize: (json['ram_size'] as num).toDouble(),
        cpuCostRateMin: (json['cpu_cost_rate_min'] as num).toDouble(),
        cpuCostRateMax: (json['cpu_cost_rate_max'] as num).toDouble(),
        ramCostRateMin: (json['ram_cost_rate_min'] as num).toDouble(),
        ramCostRateMax: (json['ram_cost_rate_max'] as num).toDouble(),
        bandwidth: (json['bandwidth'] as num).toDouble(),
        powerModel: json['power_model'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'vcpu': vcpu,
        'ram_size': ramSize,
        'cpu_cost_rate_min': cpuCostRateMin,
        'cpu_cost_rate_max': cpuCostRateMax,
        'ram_cost_rate_min': ramCostRateMin,
        'ram_cost_rate_max': ramCostRateMax,
        'bandwidth': bandwidth,
        'power_model': powerModel,
      };
}





/*

class Cluster {
  final int? id;
  final String name;
  final String region;
  final String provider;
  final int totalNodes;
  final int totalPods;
  final double totalVcpu;
  final double totalMemory;
  final double totalCpuCost;
  final double totalMemoryCost;
  final double totalCost;
  final double optimizedTotalCpuCost;
  final double optimizedTotalMemoryCost;
  final double optimizedTotalCost;
  final double computeCostPerMonth;
  final String status;
  final DateTime createdAt;

  Cluster({
    this.id,
    required this.name,
    required this.region,
    required this.provider,
    this.totalNodes = 0,
    this.totalPods = 0,
    this.totalVcpu = 0,
    this.totalMemory = 0,
    this.totalCpuCost = 0,
    this.totalMemoryCost = 0,
    this.totalCost = 0,
    this.optimizedTotalCpuCost = 0,
    this.optimizedTotalMemoryCost = 0,
    this.optimizedTotalCost = 0,
    this.computeCostPerMonth = 0,
    this.status = 'Active',
    required this.createdAt,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) => Cluster(
        id: json['id'] as int?,
        name: json['name'] as String,
        region: json['region'] as String,
        provider: json['provider'] as String,
        totalNodes: (json['total_nodes'] as num?)?.toInt() ?? 0,
        totalPods: (json['total_pods'] as num?)?.toInt() ?? 0,
        totalVcpu: (json['total_vcpu'] as num?)?.toDouble() ?? 0,
        totalMemory: (json['total_memory'] as num?)?.toDouble() ?? 0,
        totalCpuCost: (json['total_cpu_cost'] as num?)?.toDouble() ?? 0,
        totalMemoryCost: (json['total_memory_cost'] as num?)?.toDouble() ?? 0,
        totalCost: (json['total_cost'] as num?)?.toDouble() ?? 0,
        optimizedTotalCpuCost: (json['optimized_total_cpu_cost'] as num?)?.toDouble() ?? 0,
        optimizedTotalMemoryCost: (json['optimized_total_memory_cost'] as num?)?.toDouble() ?? 0,
        optimizedTotalCost: (json['optimized_total_cost'] as num?)?.toDouble() ?? 0,
        computeCostPerMonth: (json['compute_cost_per_month'] as num?)?.toDouble() ?? 0,
        status: json['status'] as String? ?? 'Active',
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'region': region,
        'provider': provider,
        'total_nodes': totalNodes,
        'total_pods': totalPods,
        'total_vcpu': totalVcpu,
        'total_memory': totalMemory,
        'total_cpu_cost': totalCpuCost,
        'total_memory_cost': totalMemoryCost,
        'total_cost': totalCost,
        'optimized_total_cpu_cost': optimizedTotalCpuCost,
        'optimized_total_memory_cost': optimizedTotalMemoryCost,
        'optimized_total_cost': optimizedTotalCost,
        'compute_cost_per_month': computeCostPerMonth,
        'status': status,
        'created_at': createdAt.toIso8601String(),
      };
}

class Node {
  final int? id;
  final int clusterId;
  final String name;
  final double cpuCostRate;
  final double memoryCostRate;
  final DateTime createdAt;
  final NodeType nodeType;

  Node({
    this.id,
    required this.clusterId,
    required this.name,
    required this.cpuCostRate,
    required this.memoryCostRate,
    required this.createdAt,
    required this.nodeType,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        id: json['id'] as int?,
        clusterId: json['cluster_id'] as int,
        name: json['name'] as String,
        cpuCostRate: (json['cpu_cost_rate'] as num).toDouble(),
        memoryCostRate: (json['memory_cost_rate'] as num).toDouble(),
        createdAt: DateTime.parse(json['created_at'] as String),
        nodeType: NodeType.fromJson(json['node_type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cluster_id': clusterId,
        'name': name,
        'cpu_cost_rate': cpuCostRate,
        'memory_cost_rate': memoryCostRate,
        'created_at': createdAt.toIso8601String(),
        'node_type': nodeType.toJson(),
      };
}

class NodeType {
  final int? id;
  final String name;
  final double vcpu;
  final double ramSize;
  final double cpuCostRateMin;
  final double cpuCostRateMax;
  final double ramCostRateMin;
  final double ramCostRateMax;
  final double bandwidth;
  final String powerModel;

  NodeType({
    this.id,
    required this.name,
    required this.vcpu,
    required this.ramSize,
    required this.cpuCostRateMin,
    required this.cpuCostRateMax,
    required this.ramCostRateMin,
    required this.ramCostRateMax,
    required this.bandwidth,
    required this.powerModel,
  });

  factory NodeType.fromJson(Map<String, dynamic> json) => NodeType(
        id: json['id'] as int?,
        name: json['name'] as String,
        vcpu: (json['vcpu'] as num).toDouble(),
        ramSize: (json['ram_size'] as num).toDouble(),
        cpuCostRateMin: (json['cpu_cost_rate_min'] as num).toDouble(),
        cpuCostRateMax: (json['cpu_cost_rate_max'] as num).toDouble(),
        ramCostRateMin: (json['ram_cost_rate_min'] as num).toDouble(),
        ramCostRateMax: (json['ram_cost_rate_max'] as num).toDouble(),
        bandwidth: (json['bandwidth'] as num).toDouble(),
        powerModel: json['power_model'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'vcpu': vcpu,
        'ram_size': ramSize,
        'cpu_cost_rate_min': cpuCostRateMin,
        'cpu_cost_rate_max': cpuCostRateMax,
        'ram_cost_rate_min': ramCostRateMin,
        'ram_cost_rate_max': ramCostRateMax,
        'bandwidth': bandwidth,
        'power_model': powerModel,
      };
}

class Pod {
  final int? id;
  final String name;
  final int clusterId;
  final int nodeId;
  final double cpuRequest;
  final double cpuUsed;
  final double memoryRequest;
  final double memoryUsed;
  final String status;
  final DateTime createdAt;

  Pod({
    this.id,
    required this.name,
    required this.clusterId,
    required this.nodeId,
    required this.cpuRequest,
    required this.cpuUsed,
    required this.memoryRequest,
    required this.memoryUsed,
    this.status = 'Running',
    required this.createdAt,
  });

  factory Pod.fromJson(Map<String, dynamic> json) => Pod(
        id: json['id'] as int?,
        name: json['name'] as String,
        clusterId: json['cluster_id'] as int,
        nodeId: json['node_id'] as int,
        cpuRequest: (json['cpu_request'] as num).toDouble(),
        cpuUsed: (json['cpu_used'] as num).toDouble(),
        memoryRequest: (json['memory_request'] as num).toDouble(),
        memoryUsed: (json['memory_used'] as num).toDouble(),
        status: json['status'] as String? ?? 'Running',
        createdAt: DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'cluster_id': clusterId,
        'node_id': nodeId,
        'cpu_request': cpuRequest,
        'cpu_used': cpuUsed,
        'memory_request': memoryRequest,
        'memory_used': memoryUsed,
        'status': status,
        'created_at': createdAt.toIso8601String(),
      };
}

class NodeUsage {
  final int? id;
  final int nodeId;
  final double cpuUsed;
  final double memoryUsed;
  final double cpuCost;
  final double memoryCost;
  final double totalCost;
  final DateTime date;

  NodeUsage({
    this.id,
    required this.nodeId,
    required this.cpuUsed,
    required this.memoryUsed,
    required this.cpuCost,
    required this.memoryCost,
    required this.totalCost,
    required this.date,
  });

  factory NodeUsage.fromJson(Map<String, dynamic> json) => NodeUsage(
        id: json['id'] as int?,
        nodeId: json['node_id'] as int,
        cpuUsed: (json['cpu_used'] as num).toDouble(),
        memoryUsed: (json['memory_used'] as num).toDouble(),
        cpuCost: (json['cpu_cost'] as num).toDouble(),
        memoryCost: (json['memory_cost'] as num).toDouble(),
        totalCost: (json['total_cost'] as num).toDouble(),
        date: DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'node_id': nodeId,
        'cpu_used': cpuUsed,
        'memory_used': memoryUsed,
        'cpu_cost': cpuCost,
        'memory_cost': memoryCost,
        'total_cost': totalCost,
        'date': date.toIso8601String(),
      };
}

class OptimizedNodeUsage {
  final int? id;
  final int nodeId;
  final double cpuUsed;
  final double memoryUsed;
  final double cpuCost;
  final double memoryCost;
  final double totalCost;
  final DateTime date;

  OptimizedNodeUsage({
    this.id,
    required this.nodeId,
    required this.cpuUsed,
    required this.memoryUsed,
    required this.cpuCost,
    required this.memoryCost,
    required this.totalCost,
    required this.date,
  });

  factory OptimizedNodeUsage.fromJson(Map<String, dynamic> json) => OptimizedNodeUsage(
        id: json['id'] as int?,
        nodeId: json['node_id'] as int,
        cpuUsed: (json['cpu_used'] as num).toDouble(),
        memoryUsed: (json['memory_used'] as num).toDouble(),
        cpuCost: (json['cpu_cost'] as num).toDouble(),
        memoryCost: (json['memory_cost'] as num).toDouble(),
        totalCost: (json['total_cost'] as num).toDouble(),
        date: DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'node_id': nodeId,
        'cpu_used': cpuUsed,
        'memory_used': memoryUsed,
        'cpu_cost': cpuCost,
        'memory_cost': memoryCost,
        'total_cost': totalCost,
        'date': date.toIso8601String(),
      };
}

class DailyComputeSpend {
  final int? id;
  final int clusterId;
  final DateTime date;
  final double totalCpuUsed;
  final double totalMemoryUsed;
  final double totalCpuCost;
  final double totalMemoryCost;
  final double totalCost;
  final double optimizedCpuCost;
  final double optimizedMemoryCost;
  final double optimizedTotalCost;

  DailyComputeSpend({
    this.id,
    required this.clusterId,
    required this.date,
    required this.totalCpuUsed,
    required this.totalMemoryUsed,
    required this.totalCpuCost,
    required this.totalMemoryCost,
    required this.totalCost,
    required this.optimizedCpuCost,
    required this.optimizedMemoryCost,
    required this.optimizedTotalCost,
  });

  factory DailyComputeSpend.fromJson(Map<String, dynamic> json) => DailyComputeSpend(
        id: json['id'] as int?,
        clusterId: json['cluster_id'] as int
 */