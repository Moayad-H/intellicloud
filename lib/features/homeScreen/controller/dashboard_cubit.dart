import 'package:flutter_bloc/flutter_bloc.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardState.initial());

  // Update the active navigation tab
  void updateActiveTab(int index) {
    emit(state.copyWith(activeTabIndex: index));
  }

  // Update filters for analytics
  void updateFilters(Map<String, dynamic> filters) {
    emit(state.copyWith(filters: filters));
  }
}
