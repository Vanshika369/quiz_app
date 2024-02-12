class QuizQuestion{

  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String>getShuffledAnswers(){
    final shuffledfList=List.of(answers);   //chaining
    shuffledfList.shuffle();
    return shuffledfList;
  }

}