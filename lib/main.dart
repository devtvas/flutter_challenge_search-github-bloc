import 'package:flutter/material.dart';
import 'package:test/app/api/bank_api.dart';
import 'package:test/app/api/mock_api.dart';
import 'package:test/app/cache/bank_cache.dart';
import 'package:test/app/repositories/banks_repository.dart';
import 'package:flutter/widgets.dart' show WidgetsFlutterBinding;

import 'app/app_widget.dart';

void main() {
  final BankRepository bankRepository = BankRepository(
    BankCache(),
    BankAPI(),
    MockAPI(),
  );

  runApp(AppWidget(bankRepository: bankRepository));
}
