import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_flash_chat/components/rounded_button.dart';
import 'package:flutter_flash_chat/screens/login_screen.dart';
import 'package:flutter_flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // AnimationController controller;
  // Animation animation;

  @override
  void initState() {
    super.initState();
    // controller = AnimationController(
    //   duration: Duration(seconds: 1),
    //   vsync: this,
    // );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    //
    // controller.forward();
    //
    // animation.addStatusListener((status) {
    //   switch (status) {
    //     case AnimationStatus.completed:
    //       controller.reverse(from: 1);
    //       break;
    //     case AnimationStatus.dismissed:
    //       controller.forward();
    //       break;
    //   }
    // });
    //
    // controller.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/images/logo.png'),
                    // height: animation.value * 100,
                    height: 60,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(top: 25),
                  child: TypewriterAnimatedTextKit(
                    speed: Duration(milliseconds: 250),
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                buttonColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.route);
                },
                buttonText: 'Log In'),
            RoundedButton(
                buttonColor: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.route);
                },
                buttonText: 'Register'),
          ],
        ),
      ),
    );
  }
}
