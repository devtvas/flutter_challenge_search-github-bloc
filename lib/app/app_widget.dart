import 'package:flutter/material.dart';
import 'package:test/app/views/list_banks_views.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List Banks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListBanksViews(),
    );
  }
}
