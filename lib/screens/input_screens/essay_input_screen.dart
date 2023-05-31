import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/neopop.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/response_service.dart';

class EssayInputScreen extends StatefulWidget {
  const EssayInputScreen({super.key});

  @override
  State<EssayInputScreen> createState() => _EssayInputScreenState();
}

class _EssayInputScreenState extends State<EssayInputScreen> {
  bool _isLoading = false;
  String result = "";
  final textFocusNode = FocusNode();

  @override
  void dispose() {
    textFocusNode.dispose();
    super.dispose();
  }

  final TextEditingController essayController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Essay",
                    style: TextStyle(
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
                            const Text(
                              "TOPIC TO BE GENERATED",
                              style: TextStyle(color: Colors.white54),
                            ),
                            TextField(
                              focusNode: textFocusNode,
                              controller: essayController,
                              maxLines: 4,
                              decoration: const InputDecoration(
                                hintText: "Write an essay on global warming",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                ),
                                border: OutlineInputBorder(
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
                                onTapUp: () {
                                  textFocusNode.unfocus();
                                  HapticFeedback.lightImpact();
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  generateEssay(essayController.text)
                                      .then((value) {
                                    setState(() {
                                      result = value;
                                      _isLoading = false;
                                    });
                                  });
                                },
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
                        const Text(
                          "KEY POINTS:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          result,
                          style: TextStyle(
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
    );
  }
}
