import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/setlabelbuttons/setlabelbuttons.dart';

class BottomSheetPage extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryonPressed;
  final String secondaryLabel;
  final VoidCallback secondaryonPressed;
  final String title;
  final String subTitle;
  const BottomSheetPage({
    Key? key,
    required this.primaryLabel,
    required this.primaryonPressed,
    required this.secondaryLabel,
    required this.secondaryonPressed,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Material(
        child: Container(
          color: AppColors.shape,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                color: Colors.black.withOpacity(0.6),
              )),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Text.rich(
                      TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                                text: "\n$subTitle",
                                style: TextStyles.buttonHeading)
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: AppColors.stroke,
                    height: 1,
                  ),
                  SetLabelButtons(
                      enablePrmeryColor: true,
                      primaryLabel: primaryLabel,
                      primaryonPressed: primaryonPressed,
                      secondaryLabel: secondaryLabel,
                      secondaryonPressed: secondaryonPressed)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
