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
    print(response.body);

    Map<String, dynamic> newResponse = jsonDecode(response.body);
    print(newResponse);
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
  print(response.body);

  Map<String, dynamic> newResponse = jsonDecode(response.body);
  print(newResponse);
  _essayresult =  newResponse['choices'][0]['text'];
  notifyListeners();
}
}
