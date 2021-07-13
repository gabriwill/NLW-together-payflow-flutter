import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/shared/models/boletomodel.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/boletolist/boletolistcontroller.dart';

class BoletoDialog extends StatelessWidget {
  final BoletoModel boleto;
  const BoletoDialog({Key? key, required this.boleto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BoletoListController();

    return BottomSheet(
      backgroundColor: AppColors.background,
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text.rich(
              TextSpan(
                  text: "O boleto ",
                  style: TextStyles.titleRegularHeading,
                  children: [
                    TextSpan(
                        text: boleto.name ?? "Sem Nome",
                        style: TextStyles.titleBoldHeading),
                    TextSpan(
                        text: " no valor de R\$ ",
                        style: TextStyles.titleRegularHeading),
                    TextSpan(
                        text: boleto.value?.toStringAsFixed(2) ?? "0,00",
                        style: TextStyles.titleBoldHeading),
                    TextSpan(
                        text: " já foi pago?",
                        style: TextStyles.titleRegularHeading),
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(color: AppColors.primary)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Ainda não",
                          style: TextStyles.buttonPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Pago",
                          style: TextStyles.buttonBoldBackground,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: AppColors.stroke,
            height: 1,
          ),
          InkWell(
            splashColor: AppColors.delete.withOpacity(0.8),
            onTap: () async {
              bool deletou = await controller.delBoleto(boleto);
              if (deletou) Navigator.pop(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(
                      FontAwesomeIcons.trashAlt,
                      color: AppColors.delete,
                    ),
                  ),
                  Text(
                    "Apagar Boleto",
                    style: TextStyles.deleteText,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
