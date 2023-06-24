import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../push_button.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id='/3';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  bool checker=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: checker,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                  email=value;
                },

                decoration:kTextFieldDecoration.copyWith(
                  hintText: 'Enter Your Email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (value) {
                  //Do something with the user input.
                  password=value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter Password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              PushButton(onPressedFunc: ()async{
                print(email);
                print(password);

                setState(() {
                  checker=true;
                });

                try{
                final user= await _auth.createUserWithEmailAndPassword(
                    email: email!, password: password!);

                print(user);
                //TODO: prompt if email address in use, exception is thrown, Navigates only if email adress and password validates
                if(user!=null) {
                  Navigator.pushNamed(context, ChatScreen.id);
                }}catch(e){
                  print(e);
                }

                setState(() {
                  checker=false;
                });

              }, colorButton: Colors.blueAccent, textString: 'Register',),
            ],
          ),
        ),
      ),
    );
  }
}
