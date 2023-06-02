import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env/env.dart';

class ResultProvider extends ChangeNotifier {
  String _result = "";
  String get result => _result;

  // bool _isLoading = false;
  // bool get isLoading => _isLoading;

  // bool _hasResults = false;
  // bool get hasResults=>_hasResults;

  Future<void> generateResult(String prompt) async {
    final apiKey = Env.gptKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'model': "text-davinci-003",
        'prompt': "Give me only 5 points for a report on $prompt",
        'temperature': 0,
        'max_tokens': 500,
      }),
    );
    print(response.body);

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    print(newResponse);
    _result = newResponse['choices'][0]['text'];
    notifyListeners();
  }
}
