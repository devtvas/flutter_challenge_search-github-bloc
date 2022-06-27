import 'package:flutter/material.dart';
import 'package:test/app/views/banks/list_banks_view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bank List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListBankView(),
    );
  }
}
