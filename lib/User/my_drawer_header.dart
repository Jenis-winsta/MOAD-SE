import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final user= FirebaseAuth.instance.currentUser;
    return Container(
      color: Colors.purple[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              //see the changes in the network image
              //do a different way for profile image
              image: const DecorationImage(
                  image: AssetImage('assets/girl.png'),
                  //NetworkImage("https://cdn5.vectorstock.com/i/1000x1000/72/74/female-avatar-profile-icon-round-woman-face-vector-18307274.jpg")
                  fit: BoxFit.scaleDown)),
        ),
        const Text(
          "Jenis Winsta",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(user!.email!,
            style: TextStyle(color: Colors.grey[200], fontSize: 14)),
      ]),
    );
  }
}
