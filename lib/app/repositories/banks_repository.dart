import 'package:test/app/models/bank_model.dart';

class BankRepository {
  final List<BankModel> _banks = [];

  List<BankModel> loadBanks() {
    _banks.addAll([
      BankModel(id: "1", name: "Brasil"),
      BankModel(id: "2", name: "Caixa"),
      BankModel(id: "3", name: "NuBank"),
      BankModel(id: "4", name: "Itau"),
      BankModel(id: "5", name: "C6"),
      BankModel(id: "6", name: "Parana"),
      BankModel(id: "7", name: "Bahia"),
      BankModel(id: "8", name: "Santander"),
      BankModel(id: "9", name: "Carrefour"),
      BankModel(id: "10", name: "PagSeguro"),
    ]);
    return _banks;
  }

  List<BankModel> addBank(BankModel bankModel) {
    _banks.add(bankModel);
    return _banks;
  }

  List<BankModel> removeBank(BankModel bankModel) {
    _banks.remove(bankModel);
    return _banks;
  }
}
