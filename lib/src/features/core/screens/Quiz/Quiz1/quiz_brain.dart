import 'questions1.dart';

class QuizBrain {
  int _questionNumber = 0;

  List questionBank = [


    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was "Moon"..', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(q: 'Bats are blind.', a: false),
    Question(q: 'A monkey was the first non-human to go into space.', a: false),
    Question(q: 'South Africa has one capital.', a: false),
    Question(q: 'Infants have more bones than adults.', a: true),
    Question(q: 'Cheesecake comes from Italy.', a: false),
    Question(q: 'The U.S. and Canada celebrate Thanksgiving on the same day.',
        a: false),
    Question(q: 'Vanilla is the world’s most expensive spice.', a: false),
    Question(q: 'Pineapples grow on trees.', a: false),
    Question(q: 'The U.S. and Canada celebrate Thanksgiving on the same day.',
        a: false),
    Question(
        q: 'The Harry Potter film, Chamber of Secrets, is the longest film of the Harry Potter movies.',
        a: true),


  ];

  void nextQuestion() {
    if (_questionNumber < (questionBank.length - 1)) {
      _questionNumber++;
    }
  }

  String getQuestionText(int questionNumber) {
    return questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return questionBank[_questionNumber].questionAnswer;
  }


}



