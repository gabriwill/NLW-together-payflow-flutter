import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boletomodel.dart';
import 'package:payflow/shared/widgets/boletolist/boletolistcontroller.dart';
import 'package:payflow/shared/widgets/boletotile/boletotile.dart';

class BoletoList extends StatefulWidget {
  const BoletoList({Key? key}) : super(key: key);

  @override
  _BoletoListState createState() => _BoletoListState();
}

class _BoletoListState extends State<BoletoList> {
  final controller = BoletoListController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
        valueListenable: controller.boletosNotifier,
        builder: (_, boletos, __) => Column(
              children: boletos
                  .map((e) => AnimatedCard(
                        direction: AnimatedCardDirection.right,
                        onRemove: () {},
                        initDelay: Duration(milliseconds: 0),
                        duration: Duration(milliseconds: 400),
                        child: BoletoTile(data: e),
                      ))
                  .toList(),
            ));
  }
}
