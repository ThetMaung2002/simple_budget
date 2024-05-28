import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_budget/Widgets/bar_graph/bar_data.dart';
import 'package:simple_budget/Widgets/ui/text_ui.dart';
import 'package:simple_budget/constants/string.dart';
import 'package:simple_budget/constants/theme_constants/light_theme_constants.dart';

class BarGraphUI extends StatelessWidget {
  const BarGraphUI(
      {super.key,
      required this.maxY,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thuAmount,
      required this.friAmount,
      required this.satAmount});

  final double maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thuAmount: thuAmount,
      friAmount: friAmount,
      satAmount: satAmount,
    );
    barData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => getBottomTiles(value, meta),
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: barData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    width: 30,
                    borderRadius: BorderRadius.circular(4),
                    color: primaryColor,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: secondaryColor,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const TextUI(label: kSun);
      break;
    case 1:
      text = const TextUI(label: kMon);
      break;
    case 2:
      text = const TextUI(label: kTue);
      break;
    case 3:
      text = const TextUI(label: kWed);
      break;
    case 4:
      text = const TextUI(label: kThu);
      break;
    case 5:
      text = const TextUI(label: kFri);
      break;
    case 6:
      text = const TextUI(label: kSat);
      break;
    default:
      text = const TextUI(label: kEmpty);
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
