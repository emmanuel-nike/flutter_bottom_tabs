import 'package:flutter_bottom_tabs/src/controllers/notifiers/questions_notifier.dart';
import 'package:flutter_bottom_tabs/src/controllers/repositories/questions_repository.dart';
import 'package:flutter_bottom_tabs/src/model/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionRepositoryProvider = Provider<IQuestionsRepository>(
  (ref) => QuestionsRepository(),
);

final questionsNotifierProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>(
      (ref) =>
          QuestionNotifier(ref.watch(questionRepositoryProvider), ref)
            ..getNextQuestion(),
    );

final questionProvider = Provider<Question>((ref) {
  final questionState = ref.watch(questionsNotifierProvider);
  if (questionState.questionStatus == QuestionStatus.loaded) {
    return questionState.currentQuestion!;
  }
  return Question();
});
