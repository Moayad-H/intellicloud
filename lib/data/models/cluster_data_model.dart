import 'package:intellicloud/utils/gmt_parser.dart';
import 'package:intl/intl.dart';

class Cluster {
  final int id;
  final String name;
  final String region;
  final String provider;
  final int totalNodes;
  final int totalPods;
  final int podsScheduled;
  final int podsUnscheduled;
  final double totalCpuRequested;
  final double totalCpuUsed;
  final double totalMemoryRequested;
  final double totalMemoryUsed;
  final double cpuCostPerHour;
  final double computeCostPerMonth;
  final String status;
  final DateTime createdAt;

  Cluster({
    required this.id,
    required this.name,
    required this.region,
    required this.provider,
    required this.totalNodes,
    required this.totalPods,
    required this.podsScheduled,
    required this.podsUnscheduled,
    required this.totalCpuRequested,
    required this.totalCpuUsed,
    required this.totalMemoryRequested,
    required this.totalMemoryUsed,
    required this.cpuCostPerHour,
    required this.computeCostPerMonth,
    required this.status,
    required this.createdAt,
  });

  factory Cluster.fromJson(Map<String, dynamic> json) {
    return Cluster(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      provider: json['provider'],
      totalNodes: json['total_nodes'],
      totalPods: json['total_pods'],
      podsScheduled: json['pods_scheduled'],
      podsUnscheduled: json['pods_unscheduled'],
      totalCpuRequested: (json['total_cpu_requested'] as num).toDouble(),
      totalCpuUsed: (json['total_cpu_used'] as num).toDouble(),
      totalMemoryRequested: (json['total_memory_requested'] as num).toDouble(),
      totalMemoryUsed: (json['total_memory_used'] as num).toDouble(),
      cpuCostPerHour: (json['cpu_cost_per_hour'] as num).toDouble(),
      computeCostPerMonth: (json['compute_cost_per_month'] as num).toDouble(),
      status: json['status'],
      createdAt: parseGmtDate(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'region': region,
      'provider': provider,
      'total_nodes': totalNodes,
      'total_pods': totalPods,
      'pods_scheduled': podsScheduled,
      'pods_unscheduled': podsUnscheduled,
      'total_cpu_requested': totalCpuRequested,
      'total_cpu_used': totalCpuUsed,
      'total_memory_requested': totalMemoryRequested,
      'total_memory_used': totalMemoryUsed,
      'cpu_cost_per_hour': cpuCostPerHour,
      'compute_cost_per_month': computeCostPerMonth,
      'status': status,
      'created_at':
          DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").format(createdAt),
    };
  }
}
