import 'package:flutter/material.dart';
import 'package:test/app/api/bank_api.dart';
import 'package:test/app/cache/bank_cache.dart';
import 'package:test/app/repositories/banks_repository.dart';

import 'app/app_widget.dart';

// void main() {
//   runApp(const AppWidget());
// }

void main() {
  final BankRepository bankRepository = BankRepository(
    BankCache(),
    BankAPI(),
  );

  runApp(AppWidget(bankRepository: bankRepository));
}
