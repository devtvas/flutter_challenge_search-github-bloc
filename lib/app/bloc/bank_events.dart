import 'package:test/app/models/bank_model.dart';

abstract class BankEvent {}

class LoadBankEvent extends BankEvent {}

class AddBankEvent extends BankEvent {
  BankModel bankModel;

  AddBankEvent({
    required this.bankModel,
  });
}

class RemoveBankEvent extends BankEvent {
  BankModel bankModel;

  RemoveBankEvent({
    required this.bankModel,
  });
}
