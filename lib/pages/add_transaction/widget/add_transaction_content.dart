import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/custom_gap.dart';
import '../../../shareds/widget/custom_button.dart';
import '../../../shareds/widget/custom_text_field.dart';
import '../../../shareds/widget/default_card.dart';
import '../controller/add_transaction_controller.dart';
import 'add_transaction_content_datetime.dart';
import 'add_transaction_content_type.dart';

class AddTransactionContent extends StatelessWidget {
  const AddTransactionContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddTransactionController>();
    final textTheme = Theme.of(context).textTheme;
    return DefaultCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TransactionContentType(controller: controller),
          VertGap.reg,
          Obx(() {
            final type = controller.type.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type == "pengeluaran" ? "Untuk" : "Dari",
                  style: textTheme.labelMedium?.copyWith(
                    color: AppColor.primaryDark,
                  ),
                ),
                VertGap.xs,
                CTextField(
                  onChanged: (_) => controller.stateChecker(),
                  controller: controller.nameC,
                  focusNode: controller.nameFN,
                  enabled: true,
                  onTapOutside: (_) => controller.nameFN.unfocus(),
                  hintText: type == "pengeluaran" ? "Beli sesuatu" : "Gaji",
                ),
              ],
            );
          }),
          VertGap.reg,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jumlah(Rp)",
                style: textTheme.labelMedium?.copyWith(
                  color: AppColor.primaryDark,
                ),
              ),
              VertGap.xs,
              CTextField( 
                onChanged: (_) => controller.stateChecker(),
                controller: controller.amountC,
                focusNode: controller.amountFN,
                enabled: true,
                keryboardType: TextInputType.number,
                onTapOutside: (_) => controller.amountFN.unfocus(),
                hintText: "100000",
              ),
            ],
          ),
          VertGap.reg,
          
          TransactionContentDateTime(controller: controller),
          VertGap.reg,
          Obx(() {
            final state = controller.buttonState.value;
            return CButton(
              state: state,
              type: ButtonType.elevated,
              text: "Simpan",
              foregroundColor: AppColor.white,
              elevation: 0,
              onPressed: controller.onSave,
            );
          }),
        ],
      ),
    );
  }
}
