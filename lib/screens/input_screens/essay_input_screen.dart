import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/widgets/custom_textfield.dart';

class EssayInputScreen extends StatefulWidget {
  const EssayInputScreen({super.key});

  @override
  State<EssayInputScreen> createState() => _EssayInputScreenState();
}

class _EssayInputScreenState extends State<EssayInputScreen> {
  final TextEditingController essayController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 15,
          ),
          child: Column(
            children: [
              const Text(
                "What topic do you want the essay for?",
                style: TextStyle(
                  fontSize: 40,
                  color: kButtonColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                essayController: essayController,
              ),
              const SizedBox(
                height: 30,
              ),
              NeoPopTiltedButton(
                onTapUp: () {
                  HapticFeedback.mediumImpact();
                },
                color: kButtonColor,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 15,
                  ),
                  child: Text(
                    'Generate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
