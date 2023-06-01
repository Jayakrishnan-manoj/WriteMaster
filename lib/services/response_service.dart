import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:write_master/env/env.dart';

Future<String> generateEssay(String prompt) async {
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
  return newResponse['choices'][0]['text'];
}

Future<String> generateMessage(String prompt) async {
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
  return newResponse['choices'][0]['text'];
}