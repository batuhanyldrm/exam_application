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
      'image': 'assets/travel.jpg',
    },
    {
      'id': 1,
      'category': 'Movies',
      'image': 'assets/movies.webp',
    },
    {
      'id': 2,
      'category': 'Education',
      'image': 'assets/education.jpg',
    },
    {
      'id': 3,
      'category': 'History',
      'image': 'assets/history.webp',
    },
    {
      'id': 4,
      'category': 'Biology',
      'image': 'assets/biology.jpg',
    },
    {
      'id': 5,
      'category': 'Sports',
      'image': 'assets/sport.webp',
    },
    {
      'id': 6,
      'category': 'Geography',
      'image': 'assets/geography.jpg',
    },
    {
      'id': 7,
      'category': 'Literature',
      'image': 'assets/literature.jpg',
    },
    {
      'id': 8,
      'category': 'Animals',
      'image': 'assets/animals.jpg',
    },
    {
      'id': 9,
      'category': 'Jobs',
      'image': 'assets/jobs.webp',
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
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.75, // Adjusted aspect ratio for image
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return Category(
            categories[index]['category'] as String,
            categories[index]['image'] as String,
            () => selectCategory(categories[index]['id'] as int),
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String categoryText;
  final String imageUrl;
  final Function onPress;

  Category(this.categoryText, this.imageUrl, this.onPress);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          onPress();
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  categoryText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/* import 'package:flutter/material.dart';
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
      'category': 'geography',
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
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3, // aspect ratio for each item
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return Category(
            categories[index]['category'] as String,
            () => selectCategory(categories[index]['id'] as int),
          );
        },
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
 */