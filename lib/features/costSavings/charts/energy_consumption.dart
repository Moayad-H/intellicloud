import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/data/models/mock_metrics.dart';

class EnergyConsumptionChart extends StatelessWidget {
  final List<Metric> metrics;

  const EnergyConsumptionChart({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(
        duration: Durations.extralong1,
        LineChartData(
          clipData: FlClipData.all(),
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: metrics
                  .sublist(0, 30)
                  .asMap()
                  .entries
                  .map((entry) => FlSpot(
                      entry.key.toDouble(), entry.value.energyConsumption))
                  .toList(),
              isCurved: true,
              color: AppColors.deepBlue,
              barWidth: 2,
              dotData: FlDotData(show: true),
            ),
          ],
        ),
      ),
    );
  }
}
