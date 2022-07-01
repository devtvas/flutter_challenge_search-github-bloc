import 'package:flutter/material.dart';
import 'package:test/app/models/bank_model.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key, this.item}) : super(key: key);
  final GitHub? item;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffFFE08E),
          title: Text("${widget.item}")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("${widget.item}")),
        ],
      ),
    );
  }
}
