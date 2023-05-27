import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/write-logo.png'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            child: NeoPopButton(
              onTapUp: () {
                HapticFeedback.lightImpact();
                AuthService().signInWithGoogle();
                print("hello");
              },
              color: kButtonColor,
              disabledColor: kButtonColor,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              //bottomShadowColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
