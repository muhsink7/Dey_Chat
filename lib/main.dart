import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flashchatter/screens/welcome_screen.dart';
import 'package:flashchatter/screens/login_screen.dart';
import 'package:flashchatter/screens/registration_screen.dart';
import 'package:flashchatter/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase before running app, otherwise app won't open
  await Firebase.initializeApp(); runApp(FlashChatter());}
//finalise the Firebase
class FlashChatter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
