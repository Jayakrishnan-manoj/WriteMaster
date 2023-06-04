import 'package:flutter/material.dart';
import 'package:neopop/neopop.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String textFieldHeader;
  final String hintText;
  final TextEditingController textFieldController;
  final FocusNode textFocusNode;
  final VoidCallback generateFunction;
  CustomInputField({
    super.key,
    required this.title,
    required this.textFieldHeader,
    required this.hintText,
    required this.textFieldController,
    required this.textFocusNode,
    required this.generateFunction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Card(
                  color: const Color(0xFF161616),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Container(
                    height: 250,
                    width: 450,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textFieldHeader,
                            style: const TextStyle(color: Colors.white54),
                          ),
                          TextField(
                            focusNode: textFocusNode,
                            controller: textFieldController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintText: hintText,
                              hintStyle: const TextStyle(
                                color: Colors.white54,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                          ),
                          Center(
                            child: NeoPopButton(
                              color: Colors.white,
                              onTapUp: () => generateFunction(),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 50,
                                ),
                                child: Text(
                                  'generate',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
