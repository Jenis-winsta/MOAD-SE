import 'package:flutter/material.dart';

class AppStatus extends StatelessWidget {
  const AppStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application status"),
      ),
      body: Text("pplication status"),
    );
  }
}