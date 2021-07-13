import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boletomodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BoletoListController {
  final boletosNotifier = ValueNotifier<List<BoletoModel>>(<BoletoModel>[]);
  List<BoletoModel> get boletos => boletosNotifier.value;
  set boletos(List<BoletoModel> value) => boletosNotifier.value = value;

  BoletoListController() {
    getBoletos();
  }

  Future<void> getBoletos() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList("boletos") ?? <String>[];
      boletos = response.map((e) => BoletoModel.fromJson(e)).toList();
    } catch (e) {
      boletos = <BoletoModel>[];
    }
  }

  Future<bool> delBoleto(BoletoModel boleto) async {
    try {
      if (boletos.any((element) => element.primaryKey == boleto.primaryKey)) {
        final instance = await SharedPreferences.getInstance();
        boletos
            .removeWhere((element) => element.primaryKey == boleto.primaryKey);
        List<String> listBoletos = boletos.map((e) => e.toJson()).toList();
        return await instance.setStringList("boletos", listBoletos);
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    boletosNotifier.dispose();
  }
}
