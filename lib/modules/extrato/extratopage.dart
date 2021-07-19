import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boletomodel.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/boletolist/boletolist.dart';
import 'package:payflow/shared/widgets/boletolist/boletolistcontroller.dart';

class ExtratoPage extends StatefulWidget {
  final BoletoListController? bListcontroller;
  ExtratoPage({Key? key, this.bListcontroller}) : super(key: key);

  @override
  _ExtratoPageState createState() => _ExtratoPageState();
}

class _ExtratoPageState extends State<ExtratoPage> {
  final bListcontroller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Meus extratos", style: TextStyles.titleBoldHeading),
                ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: widget.bListcontroller?.boletosNotifier ??
                      bListcontroller.boletosNotifier,
                  builder: (_, boletos, __) => Text.rich(TextSpan(
                      text: boletos.length.toString(),
                      style: TextStyles.captionBody,
                      children: [
                        TextSpan(
                          text: " Boletos",
                          style: TextStyles.captionBody,
                        )
                      ])),
                ),
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
              controller: widget.bListcontroller ?? bListcontroller,
            ),
          )
        ],
      ),
    );
  }
}
