import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/boletoinfo/boletoinfo.dart';
import 'package:payflow/shared/widgets/boletolist/boletolist.dart';
import 'package:payflow/shared/widgets/boletolist/boletolistcontroller.dart';

class MeusBoletosPage extends StatefulWidget {
  final BoletoListController bListcontroller;
  const MeusBoletosPage({Key? key, required this.bListcontroller})
      : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  //final bListcontroller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  color: AppColors.primary,
                ),
                AnimatedCard(
                  direction: AnimatedCardDirection.left,
                  child: BoletoInfo(
                    key: UniqueKey(),
                    controller: widget.bListcontroller,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Row(
              children: [
                Text("Meus boletos", style: TextStyles.titleBoldHeading),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Divider(
              color: AppColors.stroke,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BoletoList(
              key: UniqueKey(),
              controller: widget.bListcontroller,
            ),
          )
        ],
      ),
    );
  }
}
