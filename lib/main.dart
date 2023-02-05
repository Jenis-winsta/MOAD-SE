import 'package:finalapp/LoginScreen/login.dart';
// import 'package:finalapp/User/user.dart';
// import 'package:finalapp/Admin/admin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Admin(),
      home: Login(),
      debugShowCheckedModeBanner: false,

    );
  }
}

