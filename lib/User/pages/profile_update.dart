import 'package:flutter/material.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

// class ProfilePage extends StatelessWidget {
//   //const DashboardPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child:Text("Profile update page"),
//         ),
//     );
//   }
// }


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Update',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: EditProfileUI(),
    );
  }
}

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({super.key});

  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObscurePassword= true;
  @override
  Widget build(BuildContext context) {
    var arrow_back;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Edit profile UI'),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.white,
      //     ),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(
      //         Icons.settings,
      //         color: Colors.white,
      //         ),
      //       onPressed: () {},
      //     )  
      //   ],
      // ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover, 
                          image: AssetImage('assets/male.jpg'),
                          // NetworkImage(
                          //   'https://www.mumbailive.com/images/news/images_1532592130426_xavier_final.jpg?bg=c59f71&crop=1368%2C768%2C0%2C-0.07709252015859094&fit=fill&fitToScale=w%2C1368%2C768&fm=webp&h=768&height=768&w=1368&width=1368'
                          // ),
                        )
                      )
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white
                          ),
                          color: Colors.purple.shade700
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            
                          ), 
                          onPressed: () { //ImageUploader(); 
                          print("clicked edit");},
                        ),
                        
                      )
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField("Name", "User", false),
              buildTextField("Mobile no.", "00000 00000", false),
              buildTextField("Password", "******", true),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {}, 
                    child: Text("CANCEL", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.black
                    )),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("SAVE", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.white,
                    )),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade700,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPassWordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPassWordTextField ? isObscurePassword : false ,
        decoration: InputDecoration(
          suffixIcon: isPassWordTextField?
            IconButton(
              icon: Icon(
                isObscurePassword? Icons.visibility_off:Icons.visibility, color: Colors.purple.shade700),
              onPressed: (){
                setState(() {
              isObscurePassword = !isObscurePassword;
            });
              }, 
            ): null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )

        ),
      ),
    );
  }
}



// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Picture Upload',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Picture Upload'),
//         ),
//         body: Center(
//           child: ImageUploader(),
//         ),
//       ),
//     );
//   }
// }
/*
class ImageUploader extends StatefulWidget {
  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  late File _image;
  
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    
    setState(() {
      _image = File(pickedFile!.path);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _getImage,
          child: Text('Choose Image'),
        ),
        SizedBox(height: 20.0),
        _image != null ? Image.file(_image) : Text('No image selected'),
      ],
    );
  }
}*/
