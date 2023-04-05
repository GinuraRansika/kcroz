import 'package:flutter/material.dart';
import 'quiz_brain.dart';


QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  
  int questionNumber = 0;


  void checkAnswer(bool userPickedAnswer){
    bool correctAnswer = quizBrain.getCorrectAnswer();


    setState(() {

    if ( userPickedAnswer == correctAnswer) {
      scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
      questionNumber++;


    }
    else {
      scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
      questionNumber++;

    }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(color: Colors.deepPurple.shade900 ,
          width: double.infinity,
          child: Image.network('https://static.vecteezy.com/system/resources/thumbnails/001/991/202/small/realistic-isolated-neon-sign-of-question-template-decoration-and-covering-on-the-wall-background-vector.jpg'),),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child:  Center(
              child: Text(
                quizBrain.getQuestionText(questionNumber),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.purple.shade400,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
                print(questionNumber);


                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
                print(questionNumber);


                print(questionNumber);
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
