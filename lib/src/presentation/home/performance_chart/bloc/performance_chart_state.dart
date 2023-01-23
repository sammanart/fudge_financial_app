part of 'performance_chart_bloc.dart';

class PerformanceChartState extends Equatable {
  final from = DateTime(2021, 1);
  final to = DateTime(2021, 7);
  final double? frequency;
  final List<ChartLineDataItem>? chartLineDataItemList;
  final int? selectedIndex;

  PerformanceChartState({
    this.frequency,
    this.chartLineDataItemList,
    this.selectedIndex,
  });

  PerformanceChartState copyWith({
    double? frequency,
    List<ChartLineDataItem>? chartLineDataItemList,
    List<Widget>? plotBands,
    int? selectedIndex,
  }) {
    return PerformanceChartState(
      frequency: frequency ?? this.frequency,
      chartLineDataItemList:
          chartLineDataItemList ?? this.chartLineDataItemList,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [
        from,
        to,
        frequency,
        chartLineDataItemList,
        selectedIndex,
      ];
}
