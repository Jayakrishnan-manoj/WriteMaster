import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        title: IconButton(
          onPressed: () {
            AuthService().signOut();
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Center(
              child: Text(
                "Let me help you write ",
                style: TextStyle(
                  fontSize: 40,
                  color: kButtonColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                },
                border: Border.all(
                  color: kButtonColor,
                  width: 2,
                ),
                color: kScaffoldBackgroundColor,
                disabledColor: kScaffoldBackgroundColor,
                bottomShadowColor: kButtonColor,
                rightShadowColor: kButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 110,
                  ),
                  child: Text(
                    "ESSAY",
                    style: TextStyle(
                      color: kButtonColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                },
                border: Border.all(
                  color: kButtonColor,
                  width: 2,
                ),
                color: kScaffoldBackgroundColor,
                disabledColor: kScaffoldBackgroundColor,
                bottomShadowColor: kButtonColor,
                rightShadowColor: kButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 60,
                  ),
                  child: Text(
                    "COVER LETTER",
                    style: TextStyle(
                      color: kButtonColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                },
                border: Border.all(
                  color: kButtonColor,
                  width: 2,
                ),
                color: kScaffoldBackgroundColor,
                disabledColor: kScaffoldBackgroundColor,
                bottomShadowColor: kButtonColor,
                rightShadowColor: kButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 100,
                  ),
                  child: Text(
                    "LETTER",
                    style: TextStyle(
                      color: kButtonColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 300,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                },
                border: Border.all(
                  color: kButtonColor,
                  width: 2,
                ),
                color: kScaffoldBackgroundColor,
                disabledColor: kScaffoldBackgroundColor,
                bottomShadowColor: kButtonColor,
                rightShadowColor: kButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 100,
                  ),
                  child: Text(
                    "REPORT",
                    style: TextStyle(
                      color: kButtonColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
