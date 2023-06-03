import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:write_master/screens/input_screens/letter_input_screen.dart';

import '../constants/colors.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Color(0xFF161616),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SELECT  THE  FORMAT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const LetterInputScreen(format: 'formal'),
                    ),
                  );
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
                    horizontal: 90,
                  ),
                  child: Text(
                    "FORMAL",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: NeoPopButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const LetterInputScreen(format: 'informal'),
                    ),
                  );
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
                    horizontal: 80,
                  ),
                  child: Text(
                    "INFORMAL",
                    style: TextStyle(
                      color: Colors.white,
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
