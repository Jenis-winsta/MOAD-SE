import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // const DetailPage({super.key});

  final int index;
  // DetailPage();
  DetailPage(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        title: Text("The details page"),
      ),
      body: Center(child: Text('The details page')),
    );
  }
}