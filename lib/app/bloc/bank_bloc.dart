import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:test/app/bloc/bank_events.dart';
import 'package:test/app/bloc/bank_state.dart';
import 'package:test/app/models/bank_model.dart';
import 'package:test/app/repositories/banks_repository.dart';

//aula references: https://www.youtube.com/watch?v=UukgrBIf3Cc
class BankBloc extends Bloc<BankEvent, BankState> {
  final _bankRepo = BankRepository();

  final StreamController<BankEvent> _inputBankController =
      StreamController<BankEvent>();
  final StreamController<BankState> _outputBankController =
      StreamController<BankState>();
//todo evento de entrada! (SINK)
  Sink<BankEvent> get inputBank => _inputBankController.sink;
  //todo evento de saída! (STREAM)
  Stream<BankState> get stream => _outputBankController.stream;
  //Contructor
  BankBloc() : super(BankInitialState()) {
    _inputBankController.stream.listen(_mapEventToState);
    on<LoadBankEvent>(
      (event, emit) => emit(BankSuccessState(banks: _bankRepo.loadBanks())),
    );
    on<AddBankEvent>(
      (event, emit) =>
          emit(BankSuccessState(banks: _bankRepo.addBank(event.bankModel))),
    );
    on<RemoveBankEvent>(
      (event, emit) =>
          emit(BankSuccessState(banks: _bankRepo.removeBank(event.bankModel))),
    );
  }

  _mapEventToState(BankEvent event) {
    List<BankModel> bankModels = [];
    if (event is LoadBankEvent) {
      bankModels = _bankRepo.loadBanks();
    } else if (event is AddBankEvent) {
      bankModels = _bankRepo.addBank(event.bankModel);
    } else if (event is RemoveBankEvent) {
      bankModels = _bankRepo.removeBank(event.bankModel);
    }
    _outputBankController.add(BankSuccessState(banks: bankModels));
  }
}
