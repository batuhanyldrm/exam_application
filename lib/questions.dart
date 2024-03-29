import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  int stateCurrentQuestion = 0;
  int stateScore = 0;

  final List<Map<String, Object>> stateQuestions = [
    {
      'question': '1. Who was the Ancient Greek God of the Sun?',
      'answers': [
        {'text': 'Apollo', 'score': 1},
        {'text': 'Thor', 'score': 0},
        {'text': 'Loki', 'score': 0},
        {'text': 'Zeus', 'score': 0},
      ],
    },
    {
      'question':
          '2. What character has both Robert Downey Jr. and Benedict Cumberbatch played?',
      'answers': [
        {'text': 'Dr. John Dolittle', 'score': 0},
        {'text': 'Tony Stark', 'score': 0},
        {'text': 'Doctor Strange', 'score': 0},
        {'text': 'Sherlock Holmes', 'score': 1},
      ],
    },
    {
      'question': '3. What is the capital of Turkey?',
      'answers': [
        {'text': 'Adana', 'score': 0},
        {'text': 'Istanbul', 'score': 0},
        {'text': 'Ankara', 'score': 1},
        {'text': 'Ordu', 'score': 0},
      ],
    },
    {
      'question': '4. Which of the following is a country?',
      'answers': [
        {'text': 'Moscow', 'score': 0},
        {'text': 'Nigeria', 'score': 1},
        {'text': 'Jerusalem', 'score': 0},
        {'text': 'Barcelona', 'score': 0},
      ],
    },
    {
      'question': '5. Which of the following is not a football player?',
      'answers': [
        {'text': 'Zimbabve', 'score': 1},
        {'text': 'Pepe', 'score': 0},
        {'text': 'Mbappe', 'score': 0},
        {'text': 'Mahmut', 'score': 0},
      ],
    },
    {
      'question': '6. Which city is popular with apricot?',
      'answers': [
        {'text': 'Sivas', 'score': 0},
        {'text': 'Amasya', 'score': 0},
        {'text': 'Malatya', 'score': 1},
        {'text': 'Ordu', 'score': 0},
      ],
    },
    {
      'question': '7. Which city is popular with Iskender kebab?',
      'answers': [
        {'text': 'Elazığ', 'score': 0},
        {'text': 'Bursa', 'score': 1},
        {'text': 'Gaziantep', 'score': 0},
        {'text': 'Berlin', 'score': 0},
      ],
    },
    {
      'question':
          '8. Which of the following is not the 7 Wonders of the World?',
      'answers': [
        {'text': 'Temple of Artemis in Ephesus', 'score': 0},
        {'text': 'Halicarnassus Mausoleum.', 'score': 0},
        {'text': 'Fairy Chimneys(Kapadokya)', 'score': 1},
        {'text': 'Pyramids', 'score': 0},
      ],
    },
    {
      'question': '9. Name the longest river in the world?',
      'answers': [
        {'text': 'Irtysh River', 'score': 0},
        {'text': 'The Nile', 'score': 1},
        {'text': 'Mississippi River', 'score': 0},
        {'text': 'Amazon River', 'score': 0},
      ],
    },
    {
      'question': '10. Kratos is the main character of what video game series?',
      'answers': [
        {'text': "Assassin's Creed", 'score': 0},
        {'text': 'Hitman', 'score': 0},
        {'text': 'Call of Duty', 'score': 0},
        {'text': 'God of War', 'score': 1},
      ],
    },
  ];

  void stateResetQuiz() {
    setState(() {
      stateCurrentQuestion = 0;
      stateScore = 0;
    });
  }

  void stateAnswerQuestion(int score) {
    setState(() {
      stateScore += score;
      stateCurrentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (stateCurrentQuestion < stateQuestions.length) {
      return QuizPage(
        questions: stateQuestions,
        currentQuestion: stateCurrentQuestion,
        answerQuestion: stateAnswerQuestion,
      );
    } else {
      return ResultPage(
        score: stateScore,
        questions: stateQuestions,
        resetQuiz: stateResetQuiz,
      );
    }
  }
}

class QuizPage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int currentQuestion;
  final Function answerQuestion;

  QuizPage({
    required this.questions,
    required this.currentQuestion,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Question(
            questions[currentQuestion]['question'] as String,
          ),
          ...(questions[currentQuestion]['answers']
                  as List<Map<String, Object>>)
              .map((answer) {
            return Answer(
              answer['text'] as String,
              () => answerQuestion(answer['score']),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final Function onPress;

  Answer(this.answerText, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.all(10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: StadiumBorder(),
          side: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Text(answerText),
        onPressed: () {
          onPress();
        },
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int score;
  final VoidCallback resetQuiz;

  ResultPage({
    required this.questions,
    required this.score,
    required this.resetQuiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      '${((100 / questions.length) * score).toInt() >= 50 ? "assets/passed.png" : "assets/failed.png"}'),
                ),
              ),
            ),
            Text(
              'You scored ${((100 / questions.length) * score).toInt()}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Reset quiz'),
              onPressed: resetQuiz,
            ),
          ],
        ),
      ),
    );
  }
}
