class Question {
  late String question;
  late String questionType;
  late String correctAnswer;
  String? option1;
  String? option2;
  String? option3;
  String? option4;

  Question.multiple() {
    questionType = "multipleChoice";
  }
  Question.gapFilling() {
    questionType = "gapFilling";
  }
  Question.trueFalse() {
    questionType = "trueFalse";
  }
}
