import 'package:flutter/material.dart';
import 'questions.dart';

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
