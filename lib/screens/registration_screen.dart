import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flash_chat/components/rounded_button.dart';
import 'package:flutter_flash_chat/constants.dart';
import 'package:flutter_flash_chat/helpers/chat_credentials.dart';
import 'package:flutter_flash_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = '/register';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  var _credentials = ChatCredentials();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _credentials.emailAddress = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your email address',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _credentials.password = value;
                },
                decoration: kTextFieldInputDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                  buttonText: 'Register',
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });

                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: _credentials.emailAddress,
                              password: _credentials.password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.route);
                      }
                    } catch (e) {
                      var _errorMsg = getFirebaseError(e);
                      final snackBar = SnackBar(
                        content: Text(_errorMsg),
                        action: SnackBarAction(
                          label: 'Dismiss',
                          onPressed: () {},
                        ),
                      );
                      _scaffoldKey.currentState.showSnackBar(snackBar);
                      print('error: $e');
                    } finally {
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  },
                  buttonColor: Colors.blueAccent),
            ],
          ),
        ),
      ),
    );
  }
}
