import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../constants/custom_gap.dart';
import '../../constants/custom_size.dart';
import '../../models/model_transaction.dart';
import '../../shareds/widget/bold_text.dart';
import '../../shareds/widget/default_background.dart';
import '../../shareds/widget/default_card.dart';
import '../../utils/format_currency.dart';
import 'controller/all_transactions_controller.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({super.key});

  @override
  State<AllTransactionsPage> createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  final controller = Get.put<AllTransactionsController>(
    AllTransactionsController(),
  );

  @override
  void dispose() {
    Get.delete<AllTransactionsController>();
    super.dispose();
  }

  List<Transaction> listTransactions = [
    Transaction(
      id: 1,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Beli Pulsa",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 2,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Upwork",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 3,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Seblak Mbok Marmi Khang!",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 4,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 5,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 6,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Biaya Mancing",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 7,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Uang Saku Ibu",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 8,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Bengsin 200liter",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 9,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 10,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 1,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Beli Pulsa",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 2,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Upwork",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 3,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Seblak Mbok Marmi Khang!",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 4,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 5,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 6,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Biaya Mancing",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 7,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Uang Saku Ibu",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 8,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Bengsin 200liter",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 9,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 10,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 1,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Beli Pulsa",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 2,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Upwork",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 3,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Seblak Mbok Marmi Khang!",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 4,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 5,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 6,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Biaya Mancing",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 7,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Uang Saku Ibu",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 8,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Bengsin 200liter",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 9,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 10,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 1,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Beli Pulsa",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 2,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Upwork",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 3,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Seblak Mbok Marmi Khang!",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 4,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 5,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
    Transaction(
      id: 6,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Biaya Mancing",
      status: "pengeluaran",
      amount: 50000,
      date: "2023-09-20T10:30:00.000Z",
    ),
    Transaction(
      id: 7,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Uang Saku Ibu",
      status: "pemasukan",
      amount: 30000,
      date: "2023-09-21T11:45:00.000Z",
    ),
    Transaction(
      id: 8,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Bengsin 200liter",
      status: "pengeluaran",
      amount: 70000,
      date: "2023-09-22T09:15:00.000Z",
    ),
    Transaction(
      id: 9,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Treding forek",
      status: "pemasukan",
      amount: 20000,
      date: "2023-09-23T14:20:00.000Z",
    ),
    Transaction(
      id: 10,
      userId: 1,
      image: "https://dummyimage.com/100x100",
      name: "Nasgor uti",
      status: "pengeluaran",
      amount: 60000,
      date: "2023-09-24T13:10:00.000Z",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            VertGap.xh,
            Row(
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                    color: AppColor.white,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Semua Transaksi",
                      style: textTheme.titleMedium?.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            VertGap.reg,
            AllTransactionsNavigator(
              controller: controller,
              textTheme: textTheme,
            ),
            VertGap.reg,
            AllTransactionsContent(listTransactions: listTransactions),
            VertGap.reg,
          ],
        ),
      ),
    );
  }
}

class AllTransactionsContent extends StatelessWidget {
  const AllTransactionsContent({super.key, required this.listTransactions});

  final List<Transaction> listTransactions;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllTransactionsController>();
    return Expanded(
      child: DefaultCard(
        padding: const EdgeInsets.symmetric(
          horizontal: CSize.reg,
          vertical: CSize.xs,
        ),
        child: PageView(
          controller: controller.pageController.value,
          physics: const NeverScrollableScrollPhysics(),
          dragStartBehavior: DragStartBehavior.down,
          onPageChanged: (idx) {
            controller.setType(idx == 0 ? "pemasukan" : "pengeluaran");
          },
          children: [
            IncomeTransactions(listTransactions: listTransactions),
            ExpenseTransactions(listTransactions: listTransactions),
          ],
        ),
      ),
    );
  }
}

class IncomeTransactions extends StatelessWidget {
  const IncomeTransactions({super.key, required this.listTransactions});

  final List<Transaction> listTransactions;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          VertGap.s,
          for (Transaction transaction in listTransactions
              .where((transaction) => transaction.status == "pemasukan")) ...[
            InkWell(
              onTap: () =>
                  Get.toNamed(AppRoute.detailTransaction, arguments: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(CSize.s),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(CSize.xs),
                            ),
                            color: AppColor.primary10,
                          ),
                          child: Image.network(
                            transaction.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        HorzGap.sr,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.name ?? "-",
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              VertGap.s,
                              Text(
                                "Hari ini",
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColor.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BoldText(
                    text:
                        "${transaction.status == 'pemasukan' ? '+' : '-'} Rp${formatCurrency(transaction.amount!)}",
                    fontWeight: FontWeight.bold,
                    color: transaction.status == 'pemasukan'
                        ? AppColor.green
                        : AppColor.red,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            VertGap.s,
          ]
        ],
      ),
    );
  }
}

class ExpenseTransactions extends StatelessWidget {
  const ExpenseTransactions({super.key, required this.listTransactions});

  final List<Transaction> listTransactions;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          VertGap.s,
          for (Transaction transaction in listTransactions
              .where((transaction) => transaction.status == "pengeluaran")) ...[
            InkWell(
              onTap: () =>
                  Get.toNamed(AppRoute.detailTransaction, arguments: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(CSize.s),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(CSize.xs),
                            ),
                            color: AppColor.primary10,
                          ),
                          child: Image.network(
                            transaction.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                        HorzGap.sr,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.name ?? "-",
                                style: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              VertGap.s,
                              Text(
                                "Hari ini",
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColor.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  BoldText(
                    text:
                        "${transaction.status == 'pemasukan' ? '+' : '-'} Rp${formatCurrency(transaction.amount!)}",
                    fontWeight: FontWeight.bold,
                    color: transaction.status == 'pemasukan'
                        ? AppColor.green
                        : AppColor.red,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            VertGap.s,
          ]
        ],
      ),
    );
  }
}

class AllTransactionsNavigator extends StatelessWidget {
  const AllTransactionsNavigator({
    super.key,
    required this.controller,
    required this.textTheme,
  });

  final AllTransactionsController controller;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final type = controller.type.value;
      return Container(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(CSize.m)),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () => controller.setType("pemasukan"),
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.reg,
                    vertical: CSize.sr,
                  ),
                  decoration: BoxDecoration(
                    color: type == "pemasukan"
                        ? AppColor.primaryLight.withOpacity(.15)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(CSize.m),
                    ),
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    "Pemasukan",
                    style: textTheme.bodySmall?.copyWith(
                      color: type == "pemasukan"
                          ? AppColor.primaryLight
                          : AppColor.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => controller.setType("pengeluaran"),
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CSize.reg,
                    vertical: CSize.sr,
                  ),
                  decoration: BoxDecoration(
                    color: type == "pengeluaran"
                        ? AppColor.red.withOpacity(.15)
                        : Colors.transparent,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(CSize.m)),
                  ),
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    "Pengeluaran",
                    style: textTheme.bodySmall?.copyWith(
                      color:
                          type == "pengeluaran" ? AppColor.red : AppColor.grey,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
