part of 'dashboard_cubit.dart';

@immutable
class DashboardState {
  final int activeTabIndex;
  final Map<String, dynamic> filters;
  final bool isLoading;
  final String? errorMessage;
  final List<Metric> metrics;

  const DashboardState({
    required this.activeTabIndex,
    required this.filters,
    required this.isLoading,
    required this.errorMessage,
    required this.metrics,
  });

  // Initial state
  factory DashboardState.initial() {
    return DashboardState(
      activeTabIndex: 0,
      filters: {},
      isLoading: false,
      errorMessage: null,
      metrics: [],
    );
  }

  // Create a copy of the state with updated values
  DashboardState copyWith({
    int? activeTabIndex,
    Map<String, dynamic>? filters,
    bool? isLoading,
    String? errorMessage,
    List<Metric>? metrics,
  }) {
    return DashboardState(
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
      filters: filters ?? this.filters,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      metrics: metrics ?? this.metrics,
    );
  }
}
