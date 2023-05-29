import 'package:flutter/material.dart';
import 'package:write_master/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController essayController;
  const CustomTextField({
    super.key,
    required this.essayController,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 2.0, color: kButtonColor),
          top: BorderSide(width: 2.0, color: kButtonColor),
          right: BorderSide(width: 4.5, color: kButtonColor),
          bottom: BorderSide(width: 4.5, color: kButtonColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: TextField(
          controller: widget.essayController,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter the Topic",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
