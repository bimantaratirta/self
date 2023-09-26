import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import 'controller/statistic_controller.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final controller = Get.put<StatisticController>(StatisticController());

  @override
  void dispose() {
    Get.delete<StatisticController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistic"),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HorzGap.m,
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(CSize.xs)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.m,
                    vertical: CSize.s,
                  ),
                  child: const Text(
                    "12 Jam",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
                HorzGap.s,
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(CSize.xs)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.m,
                    vertical: CSize.s,
                  ),
                  child: const Text(
                    "Hari",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
                HorzGap.s,
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(CSize.xs)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.m,
                    vertical: CSize.s,
                  ),
                  child: const Text(
                    "Minggu",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
                HorzGap.s,
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(CSize.xs)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.m,
                    vertical: CSize.s,
                  ),
                  child: const Text(
                    "Bulan",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
                HorzGap.s,
                Container(
                  decoration: const BoxDecoration(
                    color: AppColor.primaryLight,
                    borderRadius: BorderRadius.all(Radius.circular(CSize.xs)),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.m,
                    vertical: CSize.s,
                  ),
                  child: const Text(
                    "Tahun",
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
                HorzGap.m,
              ],
            ),
          ),
          Expanded(
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
                  ),
                ),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        );
                        Widget text;
                        switch (value.toInt()) {
                          case 2:
                            text = const Text('SEPT', style: style);
                            break;
                          case 7:
                            text = const Text('OCT', style: style);
                            break;
                          case 12:
                            text = const Text('DEC', style: style);
                            break;
                          default:
                            text = const Text('');
                            break;
                        }

                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          space: 10,
                          child: text,
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        );
                        String text;
                        switch (value.toInt()) {
                          case 1:
                            text = '1m';
                            break;
                          case 2:
                            text = '2m';
                            break;
                          case 3:
                            text = '3m';
                            break;
                          case 4:
                            text = '5m';
                            break;
                          case 5:
                            text = '6m';
                            break;
                          default:
                            return Container();
                        }

                        return Text(text,
                            style: style, textAlign: TextAlign.center);
                      },
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(
                        color: AppColor.primaryLight.withOpacity(0.2),
                        width: 4),
                    left: const BorderSide(color: Colors.transparent),
                    right: const BorderSide(color: Colors.transparent),
                    top: const BorderSide(color: Colors.transparent),
                  ),
                ),
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    color: AppColor.green,
                    barWidth: 8,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(1, 1),
                      FlSpot(3, 1.5),
                      FlSpot(5, 1.4),
                      FlSpot(7, 3.4),
                      FlSpot(10, 2),
                      FlSpot(12, 2.2),
                      FlSpot(13, 1.8),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.pink,
                    barWidth: 8,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: false,
                      color: Colors.pink.withOpacity(0),
                    ),
                    spots: const [
                      FlSpot(1, 1),
                      FlSpot(3, 2.8),
                      FlSpot(7, 1.2),
                      FlSpot(10, 2.8),
                      FlSpot(12, 2.6),
                      FlSpot(13, 3.9),
                    ],
                  ),
                  LineChartBarData(
                    isCurved: true,
                    color: Colors.cyan,
                    barWidth: 8,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                    spots: const [
                      FlSpot(1, 2.8),
                      FlSpot(3, 1.9),
                      FlSpot(6, 3),
                      FlSpot(10, 1.3),
                      FlSpot(13, 2.5),
                    ],
                  ),
                ],
                minX: 0,
                maxX: 14,
                maxY: 4,
                minY: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
