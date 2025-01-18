import 'package:intellicloud/utils/gmt_parser.dart';

class DailyComputeSpend {
  final int id;
  final int clusterId;
  final DateTime date;
  final double provisionedCpu;
  final double provisionedMemory;
  final double totalCpuCost;
  final double totalMemoryCost;
  final double totalCost;

  DailyComputeSpend({
    required this.id,
    required this.clusterId,
    required this.date,
    required this.provisionedCpu,
    required this.provisionedMemory,
    required this.totalCpuCost,
    required this.totalMemoryCost,
    required this.totalCost,
  });

  factory DailyComputeSpend.fromJson(Map<String, dynamic> json) {
    return DailyComputeSpend(
      id: json['id'],
      clusterId: json['cluster_id'],
      date: parseGmtDate(json['date']),
      provisionedCpu: (json['provisioned_cpu'] as num).toDouble(),
      provisionedMemory: (json['provisioned_memory'] as num).toDouble(),
      totalCpuCost: (json['total_cpu_cost'] as num).toDouble(),
      totalMemoryCost: (json['total_memory_cost'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cluster_id': clusterId,
      'date': date.toIso8601String(),
      'provisioned_cpu': provisionedCpu,
      'provisioned_memory': provisionedMemory,
      'total_cpu_cost': totalCpuCost,
      'total_memory_cost': totalMemoryCost,
      'total_cost': totalCost,
    };
  }
}
