import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/providers/result_provider.dart';
import 'package:write_master/widgets/custom_form.dart';

class CoverLetterInput extends StatefulWidget {
  const CoverLetterInput({super.key});

  @override
  State<CoverLetterInput> createState() => _CoverLetterInputState();
}

class _CoverLetterInputState extends State<CoverLetterInput> {
  bool _isLoading = false;
  bool hasResults = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ResultProvider>(
            builder: (context, resultProvider, _) => Column(
              children: [
                CustomForm(
                  title: "Cover Letter",
                  generateFunction: () {},
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
      ),
    );
  }
}
