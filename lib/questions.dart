import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  int stateCurrentCategory = -1; // No category selected initially
  int stateScore = 0;

  final List<Map<String, Object>> stateCategories = [
    {
      'id': 0,
      'category': 'Travel',
    },
    {
      'id': 1,
      'category': 'Movies',
    },
    {
      'id': 2,
      'category': 'Education',
    },
    {
      'id': 3,
      'category': 'History',
    },
    {
      'id': 4,
      'category': 'Biology',
    },
    {
      'id': 5,
      'category': 'Sports',
    },
    {
      'id': 6,
      'category': 'News',
    },
    {
      'id': 7,
      'category': 'Literature',
    },
    {
      'id': 8,
      'category': 'Animals',
    },
    {
      'id': 9,
      'category': 'Jobs',
    },
  ];

  void selectCategory(int categoryId) {
    setState(() {
      stateCurrentCategory = categoryId;
    });
  }

  void resetQuiz() {
    setState(() {
      stateCurrentCategory = -1;
      stateScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (stateCurrentCategory == -1) {
      return CategoriesPage(
        categories: stateCategories,
        selectCategory: selectCategory,
      );
    } else {
      return QuizPage(
        categoryId: stateCurrentCategory,
        resetQuiz: resetQuiz,
      );
    }
  }
}

class CategoriesPage extends StatelessWidget {
  final List<Map<String, Object>> categories;
  final Function(int) selectCategory;

  CategoriesPage({required this.categories, required this.selectCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: categories.map((category) {
            return Category(
              category['category'] as String,
              () => selectCategory(category['id'] as int),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String answerText;
  final Function onPress;

  Category(this.answerText, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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

class QuizPage extends StatefulWidget {
  final int categoryId;
  final VoidCallback resetQuiz;

  QuizPage({required this.categoryId, required this.resetQuiz});

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  int stateCurrentQuestion = 0;
  int stateScore = 0;

  final List<Map<String, Object>> stateQuestions = [
    {
      'categoryId': 0,
      'question': '1. Who was the Ancient Greek God of the Sun?',
      'answers': [
        {'text': 'Apollo', 'score': 1},
        {'text': 'Thor', 'score': 0},
        {'text': 'Loki', 'score': 0},
        {'text': 'Zeus', 'score': 0},
      ],
    },
    {
      'categoryId': 1,
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
      'categoryId': 2,
      'question': '3. What is the capital of Turkey?',
      'answers': [
        {'text': 'Adana', 'score': 0},
        {'text': 'Istanbul', 'score': 0},
        {'text': 'Ankara', 'score': 1},
        {'text': 'Ordu', 'score': 0},
      ],
    },
    // Additional questions for each category
  ];

  void stateAnswerQuestion(int score) {
    setState(() {
      stateScore += score;
      stateCurrentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryQuestions = stateQuestions
        .where((question) => question['categoryId'] == widget.categoryId)
        .toList();

    if (stateCurrentQuestion < categoryQuestions.length) {
      return QuizQuestionPage(
        question: categoryQuestions[stateCurrentQuestion],
        answerQuestion: stateAnswerQuestion,
      );
    } else {
      return ResultPage(
        score: stateScore,
        questions: categoryQuestions,
        resetQuiz: widget.resetQuiz,
      );
    }
  }
}

class QuizQuestionPage extends StatelessWidget {
  final Map<String, Object> question;
  final Function(int) answerQuestion;

  QuizQuestionPage({
    required this.question,
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
            question['question'] as String,
          ),
          ...(question['answers'] as List<Map<String, Object>>).map((answer) {
            return Answer(
              answer['text'] as String,
              () => answerQuestion(answer['score'] as int),
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
