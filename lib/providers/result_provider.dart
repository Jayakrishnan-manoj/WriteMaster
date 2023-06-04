import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env/env.dart';

class ResultProvider extends ChangeNotifier {
  String _reportResult = "";
  String get reportResult => _reportResult;

  String _messageResult = "";
  String get messageResult => _messageResult;

  String _essayresult = "";
  String get essayResult => _essayresult;

  String _formalLetterResult = "";
  String get formalLetterResult => _formalLetterResult;

  String _informalLetterResult = "";
  String get informalLetterResult => _informalLetterResult;

  String _coverLetterResult = "";
  String get coverLetterResult => _coverLetterResult;

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

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    _reportResult = newResponse['choices'][0]['text'];
    notifyListeners();
  }

  Future<void> generateMessage(String prompt) async {
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
        'prompt': "Give me 3 messages for the given topic: $prompt",
        'temperature': 0,
        'max_tokens': 500,
      }),
    );

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    _messageResult = newResponse['choices'][0]['text'];
    notifyListeners();
  }

  Future<void> generateEssay(String prompt) async {
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
        'prompt': "Give me only 5 points for an essay on the topic: $prompt",
        'temperature': 0,
        'max_tokens': 500,
      }),
    );

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    _essayresult = newResponse['choices'][0]['text'];
    notifyListeners();
  }

  Future<void> generateLetter(String prompt, bool isFormal) async {
    final apiKey = Env.gptKey;
    var url = Uri.https("api.openai.com", "/v1/completions");

    final response = isFormal
        ? await http.post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $apiKey',
            },
            body: jsonEncode({
              'model': "text-davinci-003",
              'prompt':
                  "Give me only 4 points for formal letter on the topic: $prompt",
              'temperature': 0,
              'max_tokens': 500,
            }),
          )
        : await http.post(
            url,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $apiKey',
            },
            body: jsonEncode({
              'model': "text-davinci-003",
              'prompt':
                  "Give me only 4 points for informal letter on the topic: $prompt",
              'temperature': 0,
              'max_tokens': 500,
            }),
          );

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    if (isFormal == true) {
      _formalLetterResult = newResponse['choices'][0]['text'];
    } else {
      _informalLetterResult = newResponse['choices'][0]['text'];
    }
    notifyListeners();
  }

  Future<void> generateCoverLetter(
      String company, String skills, String role, String info) async {
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
        'prompt':
            "Give me only 5 points for the body of cover letter for the following details: Company:$company, role:$role, my skills: $skills, and my info: $info and avoid salutations. ",
        'temperature': 0,
        'max_tokens': 500,
      }),
    );

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    _coverLetterResult = newResponse['choices'][0]['text'];
    notifyListeners();
  }
}
