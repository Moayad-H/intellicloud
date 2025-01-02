part of 'dashboard_cubit.dart';

class DashboardState {
  final int activeTabIndex; // Tracks the currently active navigation tab
  final Map<String, dynamic> filters; // Stores selected chart filters

  const DashboardState({
    required this.activeTabIndex,
    required this.filters,
  });

  // Initial state
  factory DashboardState.initial() {
    return DashboardState(
      activeTabIndex: 0,
      filters: {}, // Default empty filters
    );
  }

  // Create a copy of the current state with updated values
  DashboardState copyWith({
    int? activeTabIndex,
    Map<String, dynamic>? filters,
  }) {
    return DashboardState(
      activeTabIndex: activeTabIndex ?? this.activeTabIndex,
      filters: filters ?? this.filters,
    );
  }
}
