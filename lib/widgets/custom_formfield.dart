import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController formController;
  final String label;
  final String hintText;
  final int maxLines;

  CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.formController,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10,
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        maxLines: maxLines,
        style: const TextStyle(
          color: Colors.white,
        ),
        controller: formController,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          fillColor: const Color(0xFF161616),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}
