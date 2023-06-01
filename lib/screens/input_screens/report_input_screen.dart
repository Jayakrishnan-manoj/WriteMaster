import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:write_master/constants/colors.dart';
import 'package:write_master/services/response_service.dart';

import '../../widgets/custom_inputfield.dart';

class ReportInputScreen extends StatefulWidget {
  const ReportInputScreen({super.key});

  @override
  State<ReportInputScreen> createState() => _ReportInputScreenState();
}

class _ReportInputScreenState extends State<ReportInputScreen> {
  bool _isLoading = false;
  String result = "";
  final reportFocusNode = FocusNode();
  bool hasResults = false;
  final TextEditingController reportController = TextEditingController();

  @override
  void dispose() {
    reportFocusNode.dispose();
    reportController.dispose();
    super.dispose();
  }

  void generateReportResponse() {
    reportFocusNode.unfocus();
    HapticFeedback.lightImpact();
    setState(() {
      _isLoading = true;
    });
    generateReport(reportController.text).then((value) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomInputField(
              title: 'Report',
              textFieldHeader: 'EVENT FOR THE REPORT',
              hintText: 'A report on the covid-19 pandemic',
              textFieldController: reportController,
              textFocusNode: reportFocusNode,
              generateFunction: () => generateReportResponse(),
            ),
            SingleChildScrollView(
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
