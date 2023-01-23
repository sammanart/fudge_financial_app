import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudge_financial_app/src/config/theme.dart';
import 'package:fudge_financial_app/src/core/utils/components_utils.dart';
import 'package:fudge_financial_app/src/presentation/home/performance_chart/bloc/performance_chart_bloc.dart';
import 'package:fudge_financial_app/src/presentation/widgets/custom_text_button.dart';
import 'package:intl/intl.dart';
import 'package:mrx_charts/mrx_charts.dart';

class PerformanceChart extends StatelessWidget {
  PerformanceChart({super.key});
  final performanceChartBloc = PerformanceChartBloc();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(theme),
        Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 0),
          child: BlocProvider(
            lazy: true,
            create: (context) => performanceChartBloc..add(DrawChartEvent()),
            child: BlocBuilder<PerformanceChartBloc, PerformanceChartState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    _buildPlotBands(state),
                    Chart(
                      layers: _buildLayers(theme, state),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 25.0).copyWith(
                        bottom: 14.0,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        verticalMargin(45)
      ],
    );
  }

  Widget _buildTitle(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 29),
          child: Text(
            'Performance Chart'.toUpperCase(),
            style: theme.textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        CustomTextButton(text: 'more', onPressed: () {})
      ],
    );
  }

  Widget _buildPlotBands(PerformanceChartState state) {
    return Row(children: [
      ...List.generate(
        6,
        (index) => StreamBuilder<int>(
            stream: performanceChartBloc.selectPlotBandStream,
            builder: (context, snapshot) {
              return Container(
                width: 50,
                margin: EdgeInsets.only(left: index == 0 ? 30 : 0, bottom: 20),
                decoration: BoxDecoration(
                  gradient: index != snapshot.data
                      ? const LinearGradient(
                          colors: [
                            Color(0xffF8F8FD),
                            Color(0xffF6F7FD),
                            Color(0xffF0F1FC),
                            Color(0xffEEF1FE),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )
                      : null,
                  color: const Color(0xffE4E5F7),
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                ),
              );
            }),
      ),
    ]);
  }

  List<ChartLayer> _buildLayers(
    ThemeData theme,
    PerformanceChartState state,
  ) {
    if (state.frequency == null) return [];
    return [
      _buildChartAxisLayer(theme, state),
      _buildChartLineLayer(state),
      _buildChartTooltipLayer(theme, state)
    ];
  }

  ChartAxisLayer _buildChartAxisLayer(
    ThemeData theme,
    PerformanceChartState state,
  ) {
    return ChartAxisLayer(
      settings: ChartAxisSettings(
        x: ChartAxisSettingsAxis(
          frequency: state.frequency!,
          max: state.to.millisecondsSinceEpoch.toDouble(),
          min: state.from.millisecondsSinceEpoch.toDouble(),
          textStyle: theme.textTheme.headline6!.copyWith(
            color: AppColors.fontGrey,
          ),
        ),
        y: ChartAxisSettingsAxis(
          frequency: 250,
          max: 500,
          min: 0.0,
          textStyle: theme.textTheme.headline6!.copyWith(
            color: AppColors.fontGrey,
          ),
        ),
      ),
      labelX: (value) => DateFormat('MMM')
          .format(
            DateTime.fromMillisecondsSinceEpoch(
              value.toInt(),
            ),
          )
          .toUpperCase(),
      labelY: (value) => value.toInt().toString(),
    );
  }

  ChartLineLayer _buildChartLineLayer(PerformanceChartState state) {
    return ChartLineLayer(
      items: List.generate(
        state.chartLineDataItemList!.length,
        (index) => state.chartLineDataItemList![index],
      ),
      settings: const ChartLineSettings(
        color: AppColors.blue,
        thickness: 1.5,
      ),
    );
  }

  ChartTooltipLayer _buildChartTooltipLayer(
    ThemeData theme,
    PerformanceChartState state,
  ) {
    return ChartTooltipLayer(
      shape: () => ChartTooltipLineShape<ChartLineDataItem>(
        backgroundColor: AppColors.white,
        circleBackgroundColor: const Color(0xff147AD6),
        circleBorderColor: const Color(0xff147AD6),
        circleSize: 4.0,
        circleBorderThickness: 2.0,
        triangleSideLength: 2,
        currentPos: (item) {
          performanceChartBloc.add(
            CurrentPosTapEvent(item.currentValuePos),
          );

          return item.currentValuePos;
        },
        onTextValue: (item) => item.value.toString(),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        radius: 6.0,
        textStyle: theme.textTheme.headline3!.copyWith(
          color: AppColors.black,
        ),
      ),
    );
  }
}
