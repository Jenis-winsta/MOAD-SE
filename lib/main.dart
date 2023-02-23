import 'package:finalapp/LoginScreen/loginScreen.dart';
import 'package:finalapp/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDksVq3lel1z0wmvsyyXNSq4vChSMFD290",
      // authDomain: , 
      appId: "1:885657865399:android:741b7cce9497bfa9e79132", 
      messagingSenderId: "885657865399", 
      projectId: "login-page-e77d8",
      
      ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Admin(),
      // home: SplashScreen(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return LoginScreen();
            // return SplashScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
    );
  }
}


// SafeArea(child: Login())