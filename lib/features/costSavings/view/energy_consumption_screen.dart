import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/features/costSavings/components/metrics_tile.dart';

import '../charts/energy_consumption.dart';

class EnergyConsumptionScreen extends StatefulWidget {
  const EnergyConsumptionScreen({super.key});

  @override
  State<EnergyConsumptionScreen> createState() =>
      _EnergyConsumptionScreenState();
}

class _EnergyConsumptionScreenState extends State<EnergyConsumptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            buildMetricCard(
              title: 'Total Energy',
              value: '150 kWh',
              icon: Icons.bolt,
              context: context,
            ),
            buildMetricCard(
              title: 'Cost Savings',
              value: '\$1,200',
              icon: Icons.monetization_on,
              context: context,
            ),
            buildMetricCard(
              title: 'Completed Tasks',
              value: '452',
              icon: Icons.task_alt,
              context: context,
            ),
          ],
        ),
        SizedBox(height: 20),

        // Placeholder for Charts
        BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.errorMessage != null) {
              return Center(child: Text(state.errorMessage!));
            }
            return Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey[850], // Frozen grey container
                borderRadius: BorderRadius.circular(8),
              ),
              child:
                  Center(child: EnergyConsumptionChart(metrics: state.metrics)),
            );
          },
        ),
      ],
    );
  }
}
