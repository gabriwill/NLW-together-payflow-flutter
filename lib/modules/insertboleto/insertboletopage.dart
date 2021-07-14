//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insertboleto/insertboletocontroller.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/inputtext/inputtext.dart';
import 'package:payflow/shared/widgets/setlabelbuttons/setlabelbuttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();
  final moneyInputTextController = MoneyMaskedTextController(
      leftSymbol: "R\$", decimalSeparator: ",", thousandSeparator: ".");

  final venciInputTextController = MaskedTextController(mask: "00/00/0000");
  final barcodeInputTextController = TextEditingController();
  bool _isPaid = false;

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 83, vertical: 24),
                      child: Text(
                        "Preencha os dados do boleto",
                        style: TextStyles.titleBoldHeading,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InputTextWidget(
                        label: "Nome Boleto",
                        icon: Icons.description_outlined,
                        onChanged: (value) {
                          controller.onChanged(nome: value);
                        },
                        validator: controller.validateName,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InputTextWidget(
                        controller: venciInputTextController,
                        label: "Vencimento",
                        icon: FontAwesomeIcons.timesCircle,
                        onChanged: (value) {
                          controller.onChanged(vencimento: value);
                        },
                        validator: controller.validateVencimento,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InputTextWidget(
                        controller: moneyInputTextController,
                        label: "Valor",
                        icon: FontAwesomeIcons.wallet,
                        onChanged: (value) {
                          controller.onChanged(
                              valor: moneyInputTextController.numberValue);
                        },
                        validator: (_) => controller.validateValor(
                            moneyInputTextController.numberValue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InputTextWidget(
                        controller: barcodeInputTextController,
                        label: "Código",
                        icon: FontAwesomeIcons.barcode,
                        onChanged: (value) {
                          controller.onChanged(codigo: value);
                        },
                        validator: controller.validateCodigo,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SwitchListTile(
                        title: Text(
                          'Pago',
                          style: _isPaid
                              ? TextStyles.buttonBoldPrimary
                              : TextStyles.buttonBoldHeading,
                        ),
                        secondary: Icon(
                          _isPaid ? Icons.paid : Icons.money_off,
                          color:
                              _isPaid ? AppColors.primary : AppColors.heading,
                        ),
                        value: _isPaid,
                        onChanged: (bool value) {
                          setState(() {
                            _isPaid = value;
                          });
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryonPressed: () {
          Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondaryonPressed: () async {
          controller.model.paid = _isPaid;
          bool cadastrou = await controller.cadastrar();
          if (cadastrou) Navigator.pop(context);
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
