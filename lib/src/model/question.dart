// Define the Question class to represent a survey question
class Question {
  final int id;
  final String question;
  final String systemComment;
  final List<String> options;

  Question({
    this.id = 0,
    this.question = '',
    this.systemComment = '',
    this.options = const ['1', '2', '3', '4'],
  });

  Question.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      question = json['question'] ?? '',
      systemComment = json['system_comment'] ?? '',
      options =
          (json['options'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['1', '2', '3', '4'];
  Map<String, dynamic> toJson() {
    return {'id': id, 'question': question, 'options': options};
  }
}
