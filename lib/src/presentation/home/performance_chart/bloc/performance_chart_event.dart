part of 'performance_chart_bloc.dart';

abstract class PerformanceChartEvent extends Equatable {
  const PerformanceChartEvent();

  @override
  List<Object> get props => [];
}

class DrawChartEvent extends PerformanceChartEvent {}

class CurrentPosTapEvent extends PerformanceChartEvent {
  final Offset currentPosition;

  const CurrentPosTapEvent(this.currentPosition);
}
