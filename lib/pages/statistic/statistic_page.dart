import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import 'controller/statistic_controller.dart';
import 'widget/statistic_period_card.dart';
import 'widget/statistic_type_card.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final controller = Get.put<StatisticController>(StatisticController());

  String type = "Pemasukan";
  String period = "Hari";

  @override
  void dispose() {
    Get.delete<StatisticController>();
    super.dispose();
  }

  void onPeriodChange(String period) {
    setState(() {
      this.period = period;
    });
  }

  void onTypeChange(String type) {
    setState(() {
      this.type = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Statistic"),
        centerTitle: true,
        backgroundColor: AppColor.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: CSize.m),
            child: Row(
              children: [
                StatisticTypeCard(
                  type: type,
                  title: 'Pemasukan',
                  onTypeChange: onTypeChange,
                ),
                HorzGap.s,
                StatisticTypeCard(
                  type: type,
                  title: 'Pengeluaran',
                  onTypeChange: onTypeChange,
                ),
              ],
            ),
          ),
          VertGap.s,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HorzGap.m,
                StatisticPeriodCard(
                  period: period,
                  title: 'Hari',
                  onPeriodChange: onPeriodChange,
                ),
                HorzGap.s,
                StatisticPeriodCard(
                  period: period,
                  title: 'Minggu',
                  onPeriodChange: onPeriodChange,
                ),
                HorzGap.s,
                StatisticPeriodCard(
                  period: period,
                  title: 'Bulan',
                  onPeriodChange: onPeriodChange,
                ),
                HorzGap.s,
                StatisticPeriodCard(
                  period: period,
                  title: 'Tahun',
                  onPeriodChange: onPeriodChange,
                ),
                HorzGap.m,
              ],
            ),
          ),
          VertGap.m,
          SingleChildScrollView(
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
                      tooltipBgColor: AppColor.primary10.withOpacity(.75),
                      tooltipBorder: BorderSide(
                        width: .5,
                        color: AppColor.primaryLight.withOpacity(.5),
                      ),
                      tooltipRoundedRadius: CSize.s,
                    ),
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
                        reservedSize: 0,
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
          )
        ],
      ),
    );
  }
}
