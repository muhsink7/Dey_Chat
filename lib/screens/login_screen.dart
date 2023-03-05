import 'package:flashchatter/components/rounded_button.dart';
import 'package:flashchatter/constants.dart';
import 'package:flashchatter/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getUserLoggedIn(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
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
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter the email.'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter the password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(colour: Colors.lightBlueAccent, title: 'Log In',
                  onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try{
                final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                if(user != null){
                  Navigator.pushNamed(context, ChatScreen.id);
                }
                setState(() {
                  showSpinner = false;
                });
                }
                    catch (e) {
                  print(e);
                    }
              })
            ],
          ),
        ),
      ),
    );
  }
}
