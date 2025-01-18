class Node {
  final int id;
  final int clusterId;
  final String name;
  final String type;
  final double cpuCapacity;
  final double memoryCapacity;
  final double cpuUsed;
  final double memoryUsed;
  final double instanceCostPerHour;
  final double cpuCostPerHour;

  Node({
    required this.id,
    required this.clusterId,
    required this.name,
    required this.type,
    required this.cpuCapacity,
    required this.memoryCapacity,
    required this.cpuUsed,
    required this.memoryUsed,
    required this.instanceCostPerHour,
    required this.cpuCostPerHour,
  });

  factory Node.fromJson(Map<String, dynamic> json) {
    return Node(
      id: json['id'],
      clusterId: json['cluster_id'],
      name: json['name'],
      type: json['type'],
      cpuCapacity: (json['cpu_capacity'] as num).toDouble(),
      memoryCapacity: (json['memory_capacity'] as num).toDouble(),
      cpuUsed: (json['cpu_used'] as num).toDouble(),
      memoryUsed: (json['memory_used'] as num).toDouble(),
      instanceCostPerHour: (json['instance_cost_per_hour'] as num).toDouble(),
      cpuCostPerHour: (json['cpu_cost_per_hour'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cluster_id': clusterId,
      'name': name,
      'type': type,
      'cpu_capacity': cpuCapacity,
      'memory_capacity': memoryCapacity,
      'cpu_used': cpuUsed,
      'memory_used': memoryUsed,
      'instance_cost_per_hour': instanceCostPerHour,
      'cpu_cost_per_hour': cpuCostPerHour,
    };
  }
}
