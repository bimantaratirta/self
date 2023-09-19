import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../shareds/widget/bold_text.dart';

class IndexHeader extends StatelessWidget {
  const IndexHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Selamat sore,",
          style: textTheme.bodyMedium?.copyWith(color: AppColor.white),
        ),
        const BoldText(
          text: "Luthfi Sangar",
          fontWeight: FontWeight.bold,
          color: AppColor.white,
          fontSize: 20,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
