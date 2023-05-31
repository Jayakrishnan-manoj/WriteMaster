import 'package:flutter/material.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/widgets/custom_inputfield.dart';

class MessageInputScreen extends StatefulWidget {
  const MessageInputScreen({super.key});

  @override
  State<MessageInputScreen> createState() => _MessageInputScreenState();
}

class _MessageInputScreenState extends State<MessageInputScreen> {
  final TextEditingController messageController = TextEditingController();
  final messageFocusNode = FocusNode();
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
          ),
        ],
      ),
    );
  }
}
