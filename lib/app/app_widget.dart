import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/app/bloc/bank_bloc.dart';
import 'package:test/app/pages/splash/splash.dart';
import 'package:test/app/repositories/banks_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key, required this.bankRepository}) : super(key: key);
  final BankRepository bankRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashView(),
      home: BlocProvider(
        create: (_) => BankBloc(bankRepository: bankRepository),
        child: SplashPage(),
        // child: const SplashPage(),
      ),
    );
  }
}
