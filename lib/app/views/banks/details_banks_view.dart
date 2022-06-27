import 'package:flutter/material.dart';

class DetailsBanksViews extends StatelessWidget {
  String? title;
  DetailsBanksViews({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffFFE08E), title: Text("$title")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("$title")),
        ],
      ),
    );
  }
}
