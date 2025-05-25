import 'dart:convert';

import 'package:flutter_bottom_tabs/src/model/question.dart';

abstract class IQuestionsRepository {
  Future<Question?> getNextQuestion();
}

class QuestionsRepository implements IQuestionsRepository {
  @override
  Future<Question?> getNextQuestion() async {
    String? questionData = await _getNextQuestionFromNetwork();
    return questionData != null
        ? Question.fromJson(json.decode(questionData))
        : null;
  }

  Future<String?> _getNextQuestionFromNetwork() async {
    // Simulating a network call to fetch user data
    await Future.delayed(Duration(seconds: 2));

    // Example data in JSON format
    String questionData = '''{
      "id": 123,
      "question": "What is your favorite time of the day?",
      "system_comment": "Mine is definitely the peace in the morning.",
      "options": [
        "The peace in the early mornings",
        "The magical golden hours",
        "Wind-down time after dinners",
        "The serenity past midnight"
      ]
    }''';
    return questionData;
  }
}
