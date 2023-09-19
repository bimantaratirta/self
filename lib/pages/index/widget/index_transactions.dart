import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../models/model_transaction.dart';
import 'index_transactions_card.dart';

class IndexTransactions extends StatelessWidget {
  const IndexTransactions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
    ];
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Transaksi Terakhir",
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Semua",
                  style: TextStyle(color: AppColor.grey),
                ),
              ),
            ],
          ),
          VertGap.reg,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (Transaction transaction in listTransactions) ...[
                    IndexTransactionsCard(transaction: transaction),
                    VertGap.sr,
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
