import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Metric {
  final DateTime date;
  final double energyConsumption;
  final int tasksCompleted;
  final double avgCompletionTime;
  final double cost;
  final int slaViolations;
  final double cpuUtilization;
  final double ramUtilization;

  Metric({
    required this.date,
    required this.energyConsumption,
    required this.tasksCompleted,
    required this.avgCompletionTime,
    required this.cost,
    required this.slaViolations,
    required this.cpuUtilization,
    required this.ramUtilization,
  });

  factory Metric.fromCsv(Map<String, dynamic> csvRow) {
    return Metric(
      date: DateFormat('yyyy-MM-dd').parse(csvRow['date']),
      energyConsumption: double.parse(csvRow['energy_consumption_kwh']),
      tasksCompleted: int.parse(csvRow['task_completed']),
      avgCompletionTime: double.parse(csvRow['average_completion_time_sec']),
      cost: double.parse(csvRow['cost_usd']),
      slaViolations: int.parse(csvRow['sla_violations']),
      cpuUtilization: double.parse(csvRow['cpu_utilization_pct']),
      ramUtilization: double.parse(csvRow['ram_utilization_pct']),
    );
  }
}

Future<List<Metric>> loadMetricsData() async {
  final rawCsv =
      await rootBundle.loadString('assets/cloud_dashboard_metrics.csv');
  final lines = LineSplitter.split(rawCsv).skip(1).toList();
  return lines.map((line) {
    final values = line.split(',');
    return Metric.fromCsv({
      'date': values[0],
      'energy_consumption_kwh': values[1],
      'task_completed': values[2],
      'average_completion_time_sec': values[3],
      'cost_usd': values[4],
      'sla_violations': values[5],
      'cpu_utilization_pct': values[6],
      'ram_utilization_pct': values[7],
    });
  }).toList();
}
