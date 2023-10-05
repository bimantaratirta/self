import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:self/shareds/widget/bold_text.dart';

import '../../constants/app_colors.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../models/model_transaction.dart';
import '../../shareds/widget/transaction_card.dart';
import '../../utils/dummy_data.dart';
import 'controller/statistic_controller.dart';
import 'widget/statistic_chart.dart';
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
          const StatisticChart(),
          VertGap.m,
          StatisticListTransactions(type: type),
        ],
      ),
    );
  }
}

class StatisticListTransactions extends StatefulWidget {
  const StatisticListTransactions({super.key, required this.type});

  final String type;

  @override
  State<StatisticListTransactions> createState() =>
      _StatisticListTransactionsState();
}

class _StatisticListTransactionsState extends State<StatisticListTransactions> {
  String sort = "Tertinggi";

  void sortTransactions() => sort == "Tertinggi"
      ? setState(() => sort = "Terendah")
      : setState(() => sort = "Tertinggi");

  @override
  Widget build(BuildContext context) {
    final filteredListTransactions = listTransactions.where((transaction) {
      return transaction.status?.toLowerCase() == widget.type.toLowerCase();
    }).toList();
    filteredListTransactions.sort((a, b) => sort == "Tertinggi"
        ? b.amount!.compareTo(a.amount!)
        : a.amount!.compareTo(b.amount!));
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: CSize.m),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldText(
                  text: "Pengeluaran $sort",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColor.black,
                ),
                GestureDetector(
                  onTap: sortTransactions,
                  child: Image.asset(
                    'assets/icons/sort.png',
                    width: 16,
                    height: 16,
                  ),
                )
              ],
            ),
            VertGap.reg,
            for (Transaction transaction in filteredListTransactions) ...[
              TransactionCard(transaction: transaction),
              VertGap.sr,
            ],
            VertGap.reg,
          ],
        ),
      ),
    );
  }
}
