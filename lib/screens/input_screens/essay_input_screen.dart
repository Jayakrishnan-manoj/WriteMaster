import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/response_service.dart';

import '../../widgets/custom_inputfield.dart';

class EssayInputScreen extends StatefulWidget {
  const EssayInputScreen({super.key});

  @override
  State<EssayInputScreen> createState() => _EssayInputScreenState();
}

class _EssayInputScreenState extends State<EssayInputScreen> {
  bool _isLoading = false;
  String result = "";
  final essayFocusNode = FocusNode();
  bool hasResults = false;
  final TextEditingController essayController = TextEditingController();

  @override
  void dispose() {
    essayFocusNode.dispose();
    super.dispose();
  }

  void generateEssayResponse() {
    essayFocusNode.unfocus();
    HapticFeedback.lightImpact();
    setState(() {
      _isLoading = true;
    });
    generateEssay(essayController.text).then((value) {
      setState(() {
        result = value;
        hasResults = true;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomInputField(
              title: 'Essay',
              textFieldHeader: 'TOPIC FOR THE essay',
              hintText: 'An essay on Global Warming',
              textFieldController: essayController,
              textFocusNode: essayFocusNode,
              generateFunction: () => generateEssayResponse(),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              hasResults
                                  ? const Text(
                                      "KEY POINTS:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Container(),
                              Text(
                                result,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
