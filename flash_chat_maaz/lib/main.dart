import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_maaz/screens/chat_screen.dart';
import 'package:flash_chat_maaz/screens/login_screen.dart';
import 'package:flash_chat_maaz/screens/registration_screen.dart';
import 'package:flash_chat_maaz/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

/*
void main() => runApp(FlashChat());
*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // call the Firebase.initializeApp() method
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context)=>WelcomeScreen(),
        ChatScreen.id: (context)=>ChatScreen(),
        LoginScreen.id: (context)=>LoginScreen(),
        RegistrationScreen.id: (context)=>RegistrationScreen(),
      },
    );
  }
}
