enum QuestionTypes {
  text('Text'),
  binary('Yes/No'),
  singleChoice('Single Choice'),
  multipleChoice('Multiple Choice');

  const QuestionTypes(this.value);
  final String value;
}
