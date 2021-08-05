import 'package:payflow/shared/models/boletomodel.dart';
import 'package:payflow/shared/utils/filter/filterparams.dart';

List<BoletoModel>? boletosFilter(
  List<BoletoModel> lista,
  FilterParams? params,
) {
  if (params == null) return lista;
  return lista.where((element) => element.paid == params.isPaid).toList();
}
