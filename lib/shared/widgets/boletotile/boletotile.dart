import 'package:flutter/material.dart';

import 'package:payflow/shared/models/boletomodel.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';

class BoletoTile extends StatelessWidget {
  final BoletoModel data;
  const BoletoTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.background,
      title: Text(
        data.name!,
        style: TextStyles.titleListTile,
      ),
      subtitle: Text(
        "Vence em: ${data.dueDate}",
        style: TextStyles.captionBody,
      ),
      trailing: Text.rich(TextSpan(
        text: "R\$ ",
        style: TextStyles.trailingRegular,
        children: [
          TextSpan(
            text: "${data.value!.toStringAsFixed(2)}",
            style: TextStyles.trailingBold,
          ),
        ],
      )),
    );
  }
}
