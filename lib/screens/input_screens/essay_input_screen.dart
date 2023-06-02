import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:write_master/constants/colors.dart';

import '../../providers/result_provider.dart';
import '../../widgets/custom_inputfield.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  bool _isLoading = false;
  final essayFocusNode = FocusNode();
  bool hasResults = false;
  final TextEditingController essayController = TextEditingController();

  @override
  void dispose() {
    essayFocusNode.dispose();
    essayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Consumer<ResultProvider>(
          builder: (context, resultProvider, _) => Column(
            children: [
              CustomInputField(
                title: 'Essay',
                textFieldHeader: 'TOPIC FOR THE ESSAY',
                hintText: 'An essay on global warming',
                textFieldController: essayController,
                textFocusNode: essayFocusNode,
                generateFunction: () async {
                  HapticFeedback.lightImpact();
                  essayFocusNode.unfocus();
                  setState(() {
                    _isLoading = true;
                  });
                  await Provider.of<ResultProvider>(context, listen: false)
                      .generateEssay(essayController.text);
                  setState(() {
                    _isLoading = false;
                    hasResults = true;
                  });
                },
              ),
              Column(
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
                                      "HERE YOU GO:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Container(),
                              Text(
                                resultProvider.essayResult,
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
            ],
          ),
        ),
      ),
    );
  }
}

