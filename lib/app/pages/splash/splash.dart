import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:test/app/bloc/bank_bloc.dart';
import 'package:test/app/pages/home/home_page.dart';
import 'package:test/app/repositories/banks_repository.dart';
import 'package:test/app/util/constants.dart';

import '../../util/images.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key, required this.bankRepository}) : super(key: key);
  final BankRepository bankRepository;
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: BlocProvider(
          create: (_) => BankBloc(bankRepository: bankRepository),
          child: HomePage()),
      duration: 3000,
      imageSize: 130,
      imageSrc: imageLogoSplash,
      text: Custom.titleApp,
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
