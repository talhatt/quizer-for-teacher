class Question {
  late String question;
  late String questionType;
  late String correctAnswer;
  late String option1;
  late String option2;
  late String option3;
  late String option4;

  Question.multiple() {
    this.questionType = "multipleChoice";
  }
  Question.gapFilling() {
    this.questionType = "gapFilling";
  }
  Question.trueFalse() {
    this.questionType = "trueFalse";
  }
}
