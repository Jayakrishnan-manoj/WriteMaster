import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:provider/provider.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/providers/result_provider.dart';

import '../../widgets/custom_formfield.dart';

class CoverLetterInput extends StatefulWidget {
  const CoverLetterInput({super.key});

  @override
  State<CoverLetterInput> createState() => _CoverLetterInputState();
}

class _CoverLetterInputState extends State<CoverLetterInput> {
  bool _isLoading = false;
  bool hasResults = false;
  final TextEditingController roleController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<ResultProvider>(
            builder: (context, resultProvider, _) => Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Cover Letter",
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
                        CustomFormField(
                          label: "COMPANY",
                          hintText: "Company name",
                          formController: companyController,
                          maxLines: 1,
                        ),
                        CustomFormField(
                          label: "ROLE",
                          hintText: "Role you're applying for",
                          formController: roleController,
                          maxLines: 1,
                        ),
                        CustomFormField(
                          label: "SKILLS",
                          hintText: "Flutter,Firebase,..",
                          formController: skillsController,
                          maxLines: 1,
                        ),
                        CustomFormField(
                          label: "MORE INFO",
                          hintText: "Experiences,Education,..",
                          formController: infoController,
                          maxLines: 4,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: NeoPopButton(
                            color: Colors.white,
                            onTapUp: () async {
                              HapticFeedback.lightImpact();
                              setState(() {
                                _isLoading = true;
                              });
                              await Provider.of<ResultProvider>(
                                context,
                                listen: false,
                              ).generateCoverLetter(
                                companyController.text,
                                skillsController.text,
                                roleController.text,
                                infoController.text,
                              );
                              setState(() {
                                _isLoading = false;
                                hasResults = true;
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
                  ],
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
                                  resultProvider.coverLetterResult,
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
