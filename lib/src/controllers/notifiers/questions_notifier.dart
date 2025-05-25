import 'package:flutter_bottom_tabs/src/controllers/repositories/questions_repository.dart';
import 'package:flutter_bottom_tabs/src/model/question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum QuestionStatus { intial, loading, loaded, error }

class QuestionState {
  final QuestionStatus questionStatus;
  final Question? currentQuestion;
  final bool isLoading;
  final String? errorMessage;

  const QuestionState(
    this.questionStatus, {
    this.currentQuestion,
    this.isLoading = false,
    this.errorMessage,
  });

  QuestionState copyWith({
    QuestionStatus? questionStatus,
    Question? currentQuestion,
    bool? isLoading,
    String? errorMessage,
  }) {
    return QuestionState(
      questionStatus ?? this.questionStatus,
      currentQuestion: currentQuestion ?? this.currentQuestion,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuestionState &&
        o.questionStatus == questionStatus &&
        o.currentQuestion?.id == currentQuestion?.id &&
        o.errorMessage == errorMessage;
  }

  @override
  int get hashCode =>
      questionStatus.hashCode +
      currentQuestion.hashCode +
      errorMessage.hashCode;
}

class QuestionNotifier extends StateNotifier<QuestionState> {
  final IQuestionsRepository _questionRepository;
  final Ref ref;

  QuestionNotifier(this._questionRepository, this.ref)
    : super(QuestionState(QuestionStatus.intial));

  void clearErrorStatus() {
    state = state.copyWith(
      questionStatus: QuestionStatus.loaded,
      errorMessage: "",
    );
  }

  Future<void> getNextQuestion() async {
    state = state.copyWith(questionStatus: QuestionStatus.loading);

    final question = await _questionRepository.getNextQuestion();

    state = state.copyWith(
      questionStatus: QuestionStatus.loaded,
      currentQuestion: question,
    );
  }
}
