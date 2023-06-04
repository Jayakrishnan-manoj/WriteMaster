import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../providers/result_provider.dart';
import '../../widgets/custom_inputfield.dart';

class LetterInputScreen extends StatefulWidget {
  final bool formal;
  const LetterInputScreen({
    super.key,
    required this.formal,
  });

  @override
  State<LetterInputScreen> createState() => _LetterInputScreenState();
}

class _LetterInputScreenState extends State<LetterInputScreen> {
  final TextEditingController letterController = TextEditingController();
  final FocusNode letterFocusNode = FocusNode();
  bool _isLoading = false;
  bool hasResults = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Consumer<ResultProvider>(
          builder: (context, resultProvider, _) => Column(
            children: [
              CustomInputField(
                title: widget.formal ? "Formal Letter" : "Informal Letter",
                textFieldHeader: 'SUBJECT FOR THE LETTER',
                hintText: widget.formal
                    ? "letter to HR on appraisal"
                    : "thanksgiving invitation to friend",
                textFieldController: letterController,
                textFocusNode: letterFocusNode,
                generateFunction: () async {
                  HapticFeedback.lightImpact();
                  letterFocusNode.unfocus();
                  setState(() {
                    _isLoading = true;
                  });
                  await Provider.of<ResultProvider>(context, listen: false)
                      .generateLetter(
                    letterController.text,
                    widget.formal,
                  );
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
                                      "KEY POINTS:",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    )
                                  : Container(),
                              Text(
                                widget.formal
                                    ? resultProvider.formalLetterResult
                                    : resultProvider.informalLetterResult,
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
