import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/labelbutton/labelbutton.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryonPressed;
  final String secondaryLabel;
  final VoidCallback secondaryonPressed;
  final bool enablePrmeryColor;
  final bool enableSecondaryColor;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryonPressed,
    required this.secondaryLabel,
    required this.secondaryonPressed,
    this.enablePrmeryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        children: [
          Container(
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                  label: primaryLabel,
                  onPressed: primaryonPressed,
                  style:
                      enablePrmeryColor ? TextStyles.buttonBoldPrimary : null,
                )),
                Container(
                  color: AppColors.stroke,
                  width: 1,
                  height: double.maxFinite,
                ),
                Expanded(
                    child: LabelButton(
                  label: secondaryLabel,
                  onPressed: secondaryonPressed,
                  style: enableSecondaryColor
                      ? TextStyles.buttonBoldPrimary
                      : null,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
