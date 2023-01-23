import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';
import 'package:rxdart/subjects.dart';

part 'performance_chart_event.dart';
part 'performance_chart_state.dart';

class PerformanceChartBloc
    extends Bloc<PerformanceChartEvent, PerformanceChartState> {
  final BehaviorSubject<int> selectPlotBandStream = BehaviorSubject<int>();
  PerformanceChartBloc() : super(PerformanceChartState()) {
    on<DrawChartEvent>(
      (event, emit) {
        final from = DateTime(2021, 1);
        final to = DateTime(2021, 7);
        final chartLineDataItemList = <ChartLineDataItem>[];
        final plotBands = <Widget>[];

        final frequency =
            (to.millisecondsSinceEpoch - from.millisecondsSinceEpoch) / 5.0;

        for (var i = 0; i < 6; i++) {
          chartLineDataItemList.add(
            ChartLineDataItem(
              x: (i * frequency) + from.millisecondsSinceEpoch,
              value: Random().nextInt(380) + 20,
            ),
          );
        }

        emit(
          state.copyWith(
            frequency: frequency,
            chartLineDataItemList: chartLineDataItemList,
            plotBands: plotBands,
          ),
        );
      },
    );
    on<CurrentPosTapEvent>((event, emit) {
      final selectedIndex = state.chartLineDataItemList!.indexWhere(
        (element) => element.lastValuePos == event.currentPosition,
      );

      selectPlotBandStream.add(selectedIndex);
    });
  }
}
