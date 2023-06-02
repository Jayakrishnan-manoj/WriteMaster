import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/widgets/custom_inputfield.dart';

import '../../providers/result_provider.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  bool _isLoading = false;
  final messageFocusNode = FocusNode();
  bool hasResults = false;
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    messageFocusNode.dispose();
    messageController.dispose();
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
                title: 'Messages',
                textFieldHeader: 'TOPIC FOR THE MESSAGE',
                hintText: 'Thank you message for a gift',
                textFieldController: messageController,
                textFocusNode: messageFocusNode,
                generateFunction: () async {
                  HapticFeedback.lightImpact();
                  messageFocusNode.unfocus();
                  setState(() {
                    _isLoading = true;
                  });
                  await Provider.of<ResultProvider>(context, listen: false)
                      .generateMessage(messageController.text);
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
                                resultProvider.messageResult,
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
