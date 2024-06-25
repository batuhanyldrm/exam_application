import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  int stateCurrentQuestion = 0;
  int stateScore = 0;

  final List<Map<String, Object>> stateCategories = [
    {
      'categories': [
        {'category': 'Travel'},
        {'category': 'Movies'},
        {'category': 'Education'},
        {'category': 'History'},
        {'category': 'Biyology'},
        {'category': 'Sports'},
        {'category': 'News'},
        {'category': 'Literature'},
        {'category': 'Animals'},
        {'category': 'Jobs'},
      ]
    },
  ];

  void answerQuestion() {
    setState(() {
      stateCurrentQuestion++;
      stateScore++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (stateCurrentQuestion < stateCategories.length) {
      return CategoriesPage(
        categories: stateCategories,
        answerQuestion: answerQuestion,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Categories Complete'),
        ),
        body: Center(
          child:
              Text('You completed the Categories! Your score is: $stateScore'),
        ),
      );
    }
  }
}

class CategoriesPage extends StatelessWidget {
  final List<Map<String, Object>> categories;
  final Function answerQuestion;

  CategoriesPage({required this.categories, required this.answerQuestion});

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
          children: <Widget>[
            ...(categories[0]['categories'] as List<Map<String, Object>>)
                .map((category) {
              return Category(
                category['category'] as String, // Burada cast işlemi yapıldı
                answerQuestion,
              );
            }).toList(),
          ],
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
