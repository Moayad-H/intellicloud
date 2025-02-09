import 'package:auto_size_text/auto_size_text.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/app_colors/color_constants.dart';
import 'package:intellicloud/app_colors/colors.dart';
import 'package:intellicloud/controllers/clusters/cluster_cubit.dart';
import 'package:intellicloud/controllers/clusters/cluster_states.dart';
import 'package:intellicloud/controllers/home_screen/dashboard_cubit.dart';
import 'package:intellicloud/controllers/nodes/node_states.dart';
import 'package:intellicloud/controllers/nodes/nodes_cubit.dart';
import 'package:intellicloud/data/models/node_data_model.dart';
import 'package:intellicloud/routes/app_routes.dart';
import 'package:intellicloud/utils/app_loader.dart';

class NodeListScreen extends StatefulWidget {
  const NodeListScreen({super.key});

  @override
  State<NodeListScreen> createState() => _NodeListScreenState();
}

class _NodeListScreenState extends State<NodeListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NodeCubit.get(context).loadNodes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NodeCubit, NodesState>(
      builder: (context, state) => state is NodesLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      'Node List',
                      maxLines: 1,
                      minFontSize: 14,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: AppColors.softCyan),
                    ),
                  ],
                ),
                Divider(
                  color: AppColors.textLightGray.withAlpha(50),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: AppColors.charcoalGray.withAlpha(120),
                          //     spreadRadius: 2,
                          //     blurRadius: 1,
                          //   )
                          // ],
                          color: secondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                        ),

                        //TODO REsposive
                        width: 950,
                        height: 500,
                        child: DataTable2(
                          clipBehavior: Clip.antiAlias,
                          headingRowHeight: 40,
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          minWidth: 600,
                          columns: [
                            DataColumn2(
                              onSort: (columnIndex, ascending) {},
                              label: Text(
                                'ID',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            DataColumn(
                              label: Text('Name',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                            DataColumn(
                              label: Text('Created At',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                            DataColumn(
                              label: Text('Type',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ),
                            DataColumn(
                              label: Text('Cpu Cost',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('MEM. Cost',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('CPU',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('Memory',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              numeric: true,
                            ),
                            DataColumn(
                              label: Text('Status',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                              numeric: true,
                            ),
                          ],
                          rows: NodeCubit.get(context)
                              .nodes!
                              .map((node) => _createDataRow(context, node))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

DataRow _createDataRow(BuildContext context, Node node) {
  return DataRow(cells: [
    // Node ID
    DataCell(Text(node.id.toString())),
    DataCell(Text(node.name)),
    DataCell(Text(node.createdAt.toString())),
    DataCell(Text(node.nodeType.name.toString())),
    DataCell(Text('\$${node.cpuCostRate}/h')),
    DataCell(Text('\$${node.memoryCostRate}/h')),
    DataCell(Text('${node.nodeType.vcpu}vCPU')),
    DataCell(Text('${node.nodeType.ramSize}GB')),
    DataCell(Text('Active')),
  ]);
}
