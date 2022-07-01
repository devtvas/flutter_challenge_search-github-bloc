import 'package:equatable/equatable.dart';

abstract class BankEvent extends Equatable {
  const BankEvent();
}

class TextChanged extends BankEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
