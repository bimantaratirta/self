import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_size.dart';
import '../../../utils/format_currency.dart';

class StatisticChart extends StatelessWidget {
  const StatisticChart({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: size.height / 3,
        width: size.width > 600 ? size.width : size.width * 1.5,
        margin: const EdgeInsets.only(right: CSize.m),
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipMargin: 16,
                fitInsideVertically: true,
                fitInsideHorizontally: true,
                tooltipBgColor: AppColor.primary10.withOpacity(.75),
                tooltipBorder: BorderSide(
                  width: .5,
                  color: AppColor.primaryLight.withOpacity(.5),
                ),
                tooltipRoundedRadius: CSize.s,
                getTooltipItems: (touchedSpots) {
                  return touchedSpots.map((lineBarSpot) {
                    return LineTooltipItem(
                      "Rp${formatCurrency(lineBarSpot.y.toInt())}",
                      const TextStyle(
                        color: AppColor.primaryLight,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }).toList();
                },
              ),
              getTouchedSpotIndicator: (barData, spotIndexes) {
                return spotIndexes.map((index) {
                  return TouchedSpotIndicatorData(
                    const FlLine(
                      color: AppColor.darkGrey,
                      dashArray: [7],
                      strokeWidth: 1,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: CSize.s,
                          color: AppColor.primaryLight,
                          strokeWidth: 0,
                        );
                      },
                    ),
                  );
                }).toList();
              },
            ),
            gridData: const FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    String text;
                    switch (value.toInt()) {
                      case 1:
                        text = 'Jan';
                        break;
                      case 2:
                        text = 'Feb';
                        break;
                      case 3:
                        text = 'Mar';
                        break;
                      case 4:
                        text = 'Apr';
                        break;
                      case 5:
                        text = 'Mei';
                        break;
                      case 6:
                        text = 'Jun';
                        break;
                      case 7:
                        text = 'Jul';
                        break;
                      case 8:
                        text = 'Ags';
                        break;
                      case 9:
                        text = 'Sep';
                        break;
                      case 10:
                        text = 'Okt';
                        break;
                      case 11:
                        text = 'Nov';
                        break;
                      case 12:
                        text = 'Des';
                        break;
                      default:
                        text = '';
                        break;
                    }
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: CSize.s,
                      child: Text(text),
                    );
                  },
                ),
              ),
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 0,
                ),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 0,
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 24,
                ),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: AppColor.primaryLight,
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: AppColor.primaryLight,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.primaryLight.withAlpha(100),
                      AppColor.primary10,
                      AppColor.white,
                    ],
                  ),
                ),
                spots: const [
                  FlSpot(1, 10000),
                  FlSpot(2, 20000),
                  FlSpot(3, 15000),
                  FlSpot(4, 50000),
                  FlSpot(5, 100000),
                  FlSpot(6, 26370),
                  FlSpot(7, 65728),
                  FlSpot(8, 81246),
                  FlSpot(9, 92472),
                  FlSpot(10, 25777),
                  FlSpot(11, 78999),
                  FlSpot(12, 50000),
                ],
              ),
            ],
            minX: 0,
            maxX: 12,
            maxY: 100000,
            minY: 0,
          ),
        ),
      ),
    );
  }
}
