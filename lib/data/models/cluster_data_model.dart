import 'package:intellicloud/utils/gmt_parser.dart';
import 'package:intl/intl.dart';

class Cluster {
  final int id;
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
  final DateTime? createdAt;

  Cluster({
    required this.id,
    required this.name,
    required this.region,
    required this.provider,
    required this.totalNodes,
    required this.totalPods,
    required this.totalVcpu,
    required this.totalMemory,
    required this.totalCpuCost,
    required this.totalMemoryCost,
    required this.totalCost,
    required this.optimizedTotalCpuCost,
    required this.optimizedTotalMemoryCost,
    required this.optimizedTotalCost,
    required this.computeCostPerMonth,
    required this.status,
    this.createdAt,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      provider: json['provider'],
      totalNodes: json['total_nodes'],
      totalPods: json['total_pods'],
      totalVcpu: (json['total_vcpu'] as num).toDouble(),
      totalMemory: (json['total_memory'] as num).toDouble(),
      totalCpuCost: (json['total_cpu_cost'] as num).toDouble(),
      totalMemoryCost: (json['total_memory_cost'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
      optimizedTotalCpuCost:
          (json['optimized_total_cpu_cost'] as num).toDouble(),
      optimizedTotalMemoryCost:
          (json['optimized_total_memory_cost'] as num).toDouble(),
      optimizedTotalCost: (json['optimized_total_cost'] as num).toDouble(),
      computeCostPerMonth: (json['compute_cost_per_month'] as num).toDouble(),
      status: json['status'],
      createdAt: parseGmtDate(json['created_at']),
    );
  }
}
