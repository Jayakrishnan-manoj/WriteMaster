import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/response_service.dart';
import 'package:write_master/widgets/custom_inputfield.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  final TextEditingController messageController = TextEditingController();
  final messageFocusNode = FocusNode();
  String result = "";
  bool _isLoading = false;
  bool hasResults = false;

  @override
  void dispose() {
    messageFocusNode.dispose();
    super.dispose();
  }

  void generateMessageResponse() {
    messageFocusNode.unfocus();
    HapticFeedback.lightImpact();
    setState(() {
      _isLoading = true;
    });
    generateMessage(messageController.text).then((value) {
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
      body: Column(
        children: [
          CustomInputField(
            title: 'Messages',
            textFieldHeader: 'TOPIC FOR THE MESSAGE',
            hintText: 'Thank you message for a gift',
            textFieldController: messageController,
            textFocusNode: messageFocusNode,
            generateFunction: () => generateMessageResponse(),
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
        ],
      ),
    );
  }
}
