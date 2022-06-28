import 'package:test/app/models/bank_model.dart';

abstract class BankState {
  List<BankModel> banks;

  BankState({
    required this.banks,
  });
}

class BankInitialState extends BankState {
  BankInitialState() : super(banks: []);
}

class BankSuccessState extends BankState {
  BankSuccessState({required List<BankModel> banks}) : super(banks: banks);
}

//TODO
class BankErrorState extends BankState {
  BankErrorState({required List<BankModel> banks}) : super(banks: banks);
}
