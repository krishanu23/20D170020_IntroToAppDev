class QuestionClass{
  final String questionText;
  final bool questionAnswer;

  QuestionClass({required this.questionText, required this.questionAnswer});
}

class QuestionBank{
  List<QuestionClass> questionBrain = [
    QuestionClass(questionText: 'Electrons are larger than molecules', questionAnswer: false),
    QuestionClass(questionText: 'The Atlantic Ocean is biggest ocean in the world', questionAnswer: false),
    QuestionClass(questionText: 'The chemical make up food is often change when you cook it', questionAnswer: true),
    QuestionClass(questionText: "The human body have 4 lungs", questionAnswer: false),

  ];
}