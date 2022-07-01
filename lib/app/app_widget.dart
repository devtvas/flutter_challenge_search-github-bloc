import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/app/bloc/bank_bloc.dart';
import 'package:test/app/pages/home/home_page.dart';
import 'package:test/app/pages/splash/splash.dart';
import 'package:test/app/repositories/banks_repository.dart';
import 'package:test/app/util/constants.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key, required this.bankRepository}) : super(key: key);
  final BankRepository bankRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Custom.titleApp,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashView(),
      home: BlocProvider(
        create: (_) => BankBloc(bankRepository: bankRepository),
        child: SplashPage(bankRepository: bankRepository),
        // child: const SplashPage(),
      ),
    );
  }
}
