import 'package:equatable/equatable.dart';

import 'package:test/app/models/bank_model.dart';

abstract class BankState extends Equatable {
  const BankState();

  @override
  List<Object> get props => [];
}

class BankStateEmpty extends BankState {}

class BankStateLoading extends BankState {}

class BankStateSuccess extends BankState {
  const BankStateSuccess(this.items);

  final List<BankModel> items;

  @override
  List<Object> get props => [items];

  @override
  String toString() => 'BankStateSuccess { items: ${items.length} }';
}

class BankStateError extends BankState {
  const BankStateError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
