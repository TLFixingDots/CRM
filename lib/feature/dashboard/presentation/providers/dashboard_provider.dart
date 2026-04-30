import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DashboardPeriod { week, month, year }

class DashboardFilters {
  final String financialYear;
  final DashboardPeriod period;
  final String subPeriod; // W1, W2, etc. or Jan, Feb, etc.

  DashboardFilters({
    required this.financialYear,
    required this.period,
    required this.subPeriod,
  });

  DashboardFilters copyWith({
    String? financialYear,
    DashboardPeriod? period,
    String? subPeriod,
  }) {
    return DashboardFilters(
      financialYear: financialYear ?? this.financialYear,
      period: period ?? this.period,
      subPeriod: subPeriod ?? this.subPeriod,
    );
  }
}

class DashboardFilterNotifier extends StateNotifier<DashboardFilters> {
  DashboardFilterNotifier() : super(DashboardFilters(
    financialYear: '2024-25',
    period: DashboardPeriod.month,
    subPeriod: 'Current',
  ));

  void setFinancialYear(String year) {
    state = state.copyWith(financialYear: year);
  }

  void setPeriod(DashboardPeriod period) {
    state = state.copyWith(period: period, subPeriod: 'Current');
  }

  void setSubPeriod(String sub) {
    state = state.copyWith(subPeriod: sub);
  }
}

final dashboardFilterProvider = StateNotifierProvider<DashboardFilterNotifier, DashboardFilters>((ref) {
  return DashboardFilterNotifier();
});
