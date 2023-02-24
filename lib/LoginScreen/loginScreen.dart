import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:finalapp/Admin/admin.dart';
import 'package:finalapp/Admin_Web/admin_web.dart';
import 'package:finalapp/LoginScreen/registation.dart';
import 'package:finalapp/User/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey= GlobalKey<FormState>();

  String username_='';
  String password_='';
  String fullname='';
  bool login = false;









  /*static Future<User?> loginUsingEmailPassword({required String username,required String password, required BuildContext context})async{
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: username, password: password);
      user=userCredential.user;
      // Navigator.pushReplacement(context, '/home');
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        print("No user found for that email");
      }
    }
    
    return user;
  }*/





  login1(String username,String password){
    print(username);
    print(password);

    CollectionReference colref=
        FirebaseFirestore.instance.collection('user');

    Map<String,dynamic> user_map={
      "name":username,
      "password":password,
      "username":username,
    };

    colref
          .add(user_map)
          .then((value) => print("user added"))
          .catchError((error)=>print("Failed to add user: $username"));

  }

  login_fun(String username,String password){
    
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("user").doc(username);

    // DocumentReference documentReference =
    //     FirebaseFirestore.instance.collection("Pets").doc(petName);
    documentReference.get().then((datasnapshot) {
      if (kDebugMode) {
        print(datasnapshot.data());
      }
      else{
        print("error");
      }
    });

  }

  Future signIn() async{
    // showDialog(context: context,
    // barrierDismissible: false,
    //  builder: (context)=>Center(child: CircularProgressIndicator())
    //  );
    try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: usernameTEC.text.trim(), password: passwordTEC.text.trim());

    }
    on FirebaseAuthException catch (e){
      print(e);
    }
    //Navigator.of(content) not worl
    // navigatorKey.currentState!.popUntil((route)=>rout)
  }







  TextEditingController usernameTEC = TextEditingController();
  TextEditingController passwordTEC = TextEditingController();
  bool isRememberMe = false;
  bool _obscureText = true;

  @override
  void dispose(){
    usernameTEC.dispose();
    passwordTEC.dispose();
    super.dispose();
  }

  // static login(){
  //   DocumentReference documentReference =
  //       FirebaseFirestore.instance.collection("Pets").doc(petName);
  //   documentReference.get().then((datasnapshot) {
  //     if (kDebugMode) {
  //       print(datasnapshot.data());
  //     }
  //   }
  //   );
  // }

  Widget buildUsername() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Username',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            key: ValueKey('username'),
            controller: usernameTEC,
            // keyboardType: TextInputType.usernameAddress,
            style: const TextStyle(color: Colors.black87),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(Icons.person, color: Color(0xffC468F9)),
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.black38)),
            validator: (value){
              if(value!.length<6){
                return 'please enter proper username';
              }else{
                return null;
              }
            },
            onSaved: (value){
              setState(() {
                username_=value!;
              });
            },
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            key: ValueKey('password'),
            validator: (value){
              if(value!.length<6){
                return 'please enter proper password';
              }else{
                return null;
              }
            },
            onSaved:(value){
              setState(() {
                password_=value!;
              });
            },
            
            controller: passwordTEC,
            obscureText: _obscureText,
            style: const TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 14),
              prefixIcon: const Icon(Icons.lock, color: Color(0xffC468F9)),
              hintText: 'Password',
              hintStyle: const TextStyle(color: Colors.black38),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        // padding: EdgeInsets.only(right: 0),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: isRememberMe,
              checkColor: Colors.purple,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  isRememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            'Remember Me',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          backgroundColor: const Color.fromARGB(255, 127, 7, 148),
          padding: const EdgeInsets.all(25),
          shadowColor: Colors.white,
        ),
        onPressed: () async{
          // if(_formKey.currentState!.validate()){
          //   _formKey.currentState!.save();
          //   login ? AuthServices.login_fun(username_,password_,context):AuthServices.signupUser(username_,password_,context);
          // }
          var _username = usernameTEC.text;
          var _pass = passwordTEC.text;
          login_fun(_username,_pass);
          signIn();
          // LoginFirebase(_username,_pass);
          // if (_username == 'jenis' && _pass == 'jenis') {
          //   print("user");
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => const as_User()));
          // } else if (_username == 'adminm' && _pass == 'adminm') {
          //   print("admin");
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => const Admin()));
          // } else if (_username == 'admin' && _pass == 'admin') {
          //   print("admin");
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (context) => Admin_Web()));
          // } else {
          //   print("error");
          // }
          print('Login Pressed');
          //User();

          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => User()));
        },
        child: const Text(
          'LOGIN',
          style: TextStyle(
            // color: Colors.purple,
            color: Color.fromARGB(255, 251, 251, 251),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //color: Colors.white,
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      // onTap: (() => print("Sign Up Pressed")),
      onTap: (){
        print("sign up");
        Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registration()));
        // Registration();

      },
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_formKey,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(102, 150, 51, 207),
                      Color.fromARGB(153, 160, 52, 222),
                      Color.fromARGB(204, 177, 54, 248),
                      Color.fromARGB(255, 190, 90, 248),
                    ],
                  )),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 50),
                        buildUsername(),
                        const SizedBox(height: 20),
                        buildPassword(),
                        buildForgotPassBtn(),
                        buildRememberCb(),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
