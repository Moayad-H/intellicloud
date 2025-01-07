import 'dart:async';
import 'dart:convert';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intellicloud/data/models/mock_metrics.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());
  SideMenuController controller = SideMenuController();
  static int activeTabIndex = 0;
  static DashboardCubit get(context) =>
      BlocProvider.of<DashboardCubit>(context);
  // Update the active navigation tab
  Future<void> updateActiveTab(int index) async {
    activeTabIndex = index;
    print('Active Tab after update: $activeTabIndex');
    emit(state.copyWith(activeTabIndex: index));
    controller.changePage(index);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('activeTabIndex', index);
  }

  Future<void> loadActiveTabIndex() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIndex = prefs.getInt('activeTabIndex') ?? 0;
    emit(state.copyWith(activeTabIndex: savedIndex));
    controller.changePage(savedIndex);
  }

  // Update filters for analytics
  void updateFilters(Map<String, dynamic> filters) {
    emit(state.copyWith(filters: filters));
  }

  // Load metrics from CSV file
  Future<void> loadMetrics() async {
    try {
      emit(state.copyWith(isLoading: true));

      // Load the CSV file from assets
      final rawCsv =
          await rootBundle.loadString('/cloud_dashboard_metrics.csv');

      final lines = LineSplitter.split(rawCsv).toList();

      // Parse CSV header and rows
      final headers = lines.first.split(',');
      final rows = lines.skip(1).map((line) => line.split(',')).toList();

      // Convert rows to a list of Metric objects
      final metrics = rows.map((row) {
        final data = Map<String, dynamic>.fromIterables(headers, row);
        return Metric.fromCsv(data);
      }).toList();

      // Update the state with the loaded metrics
      emit(state.copyWith(metrics: metrics, isLoading: false));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Failed to load metrics: $e'));
    }
  }
}
