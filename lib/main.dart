import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flash_chat/constants.dart';
import 'package:flutter_flash_chat/screens/welcome_screen.dart';
import 'package:flutter_flash_chat/screens/login_screen.dart';
import 'package:flutter_flash_chat/screens/registration_screen.dart';
import 'package:flutter_flash_chat/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyText2: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        ChatScreen.route: (context) => ChatScreen(),
      },
    );
  }
}
