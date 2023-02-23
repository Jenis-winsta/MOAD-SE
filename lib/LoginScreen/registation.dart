import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalapp/LoginScreen/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

class Registration extends StatelessWidget {
  //  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration Page',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool _obscureText = true;
  bool verify = false;

  final message = SnackBar(content: Text("JEnsi"));

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _submitForm() {
    // if (_formKey.currentState.validate()) {
    String name = _nameController.text.trim();
    String id = _idController.text.trim();
    String mobile = _mobileController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    print('Name: $name');
    print('ID: $id');
    print('Mobile: $mobile');
    print('Email: $email');
    print('Username: $username');
    print('Password: $password');
    // }
  }

  void _createUser() {
    String name = _nameController.text.trim();
    String id = _idController.text.trim();
    String mobile = _mobileController.text.trim();
    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("user").doc(username);

    //Map
    Map<String, dynamic> myPets = {
      "Name": name,
      "id": id,
      "mobile": mobile,
      "email": email,
      "username": username,
      "password": password,
      // "Mobile number": mobileNumber,
      // "Email address": emailAddress,
    };

    documentReference.set(myPets).whenComplete(() {
      if (kDebugMode) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Regisered successfully"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0)),
        );
        print("$name created");
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text("Could not create User"),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name'),
              TextFormField(
                controller: _nameController,
              ),
              SizedBox(height: 16.0),
              Text('ID'),
              TextFormField(
                controller: _idController,
              ),
              SizedBox(height: 16.0),
              Text('Mobile'),
              TextFormField(
                controller: _mobileController,
              ),
              SizedBox(height: 16.0),
              Text('Email'),
              TextFormField(
                controller: _emailController,
              ),
              SizedBox(height: 16.0),
              Text('Username'),
              TextFormField(
                controller: _usernameController,
              ),
              SizedBox(height: 16.0),
              Text('Password'),
              TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      // labelText: 'Password',
                      suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ))),
              SizedBox(height: 32.0),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
                      onPressed: () {
                        print("object");
                        _submitForm();
                        _createUser();
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
