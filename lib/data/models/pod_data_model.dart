import 'package:intellicloud/utils/gmt_parser.dart';

class Pod {
  final int id;
  final int clusterId;
  final int? nodeId;
  final String name;
  final double cpuRequested;
  final double memoryRequested;
  final String status;
  final DateTime createdAt;
  final DateTime? terminatedAt;
  final bool slaViolation;

  Pod({
    required this.id,
    required this.clusterId,
    this.nodeId,
    required this.name,
    required this.cpuRequested,
    required this.memoryRequested,
    required this.status,
    required this.createdAt,
    this.terminatedAt,
    required this.slaViolation,
  });

  factory Pod.fromJson(Map<String, dynamic> json) {
    return Pod(
      id: json['id'],
      clusterId: json['cluster_id'],
      nodeId: json['node_id'],
      name: json['name'],
      cpuRequested: (json['cpu_requested'] as num).toDouble(),
      memoryRequested: (json['memory_requested'] as num).toDouble(),
      status: json['status'],
      createdAt: parseGmtDate(json['created_at']),
      terminatedAt: json['terminated_at'] != null
          ? parseGmtDate(json['terminated_at'])
          : null,
      slaViolation: json['sla_violation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cluster_id': clusterId,
      'node_id': nodeId,
      'name': name,
      'cpu_requested': cpuRequested,
      'memory_requested': memoryRequested,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'terminated_at': terminatedAt?.toIso8601String(),
      'sla_violation': slaViolation,
    };
  }
}
