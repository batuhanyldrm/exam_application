import 'package:flutter/material.dart';

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
      'categoryId': 0,
      'question': '2. Which city is popular with apricot?',
      'answers': [
        {'text': 'Sivas', 'score': 0},
        {'text': 'Amasya', 'score': 0},
        {'text': 'Malatya', 'score': 1},
        {'text': 'Ordu', 'score': 0},
      ],
    },
    {
      'categoryId': 0,
      'question': '3. Which city is popular with Iskender kebab?',
      'answers': [
        {'text': 'Elazığ', 'score': 0},
        {'text': 'Bursa', 'score': 1},
        {'text': 'Gaziantep', 'score': 0},
        {'text': 'Berlin', 'score': 0},
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
      'question':
          '1. Look at the picture and then choose the correct statement.',
      'image': 'assets/santaClaus.jpg',
      'answers': [
        {'text': 'Santa Claus is everywhere in the picture', 'score': 0},
        {'text': 'Santa Claus is on the right of the picture', 'score': 1},
        {'text': 'Santa Claus is in the middle of the picture', 'score': 0},
        {'text': 'Santa Claus is on the left of the picture', 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question': '2. The tree ______ by lightning.',
      'answers': [
        {'text': "was flashed", 'score': 0},
        {'text': 'struck', 'score': 0},
        {'text': 'was struck', 'score': 1},
        {'text': 'flashed', 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question': "3. Where's the ______ post office, please?",
      'answers': [
        {'text': "most near", 'score': 0},
        {'text': 'near', 'score': 0},
        {'text': 'more near', 'score': 0},
        {'text': 'nearest', 'score': 1},
      ],
    },
    {
      'categoryId': 2,
      'question': '4. How long ______ English?',
      'answers': [
        {'text': "do you learn", 'score': 0},
        {'text': 'are you learning', 'score': 0},
        {'text': 'have you been learning', 'score': 1},
        {'text': 'you learn', 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question':
          '5. We would never have had the accident if you ______ so fast.',
      'answers': [
        {'text': "wouldn't been driving", 'score': 0},
        {'text': "hadn't been driving", 'score': 1},
        {'text': 'had driven', 'score': 0},
        {'text': "wouldn't drive", 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question':
          '6. Look at the picture and then choose the correct statement.',
      'image': 'assets/englishGiving.jpg',
      'answers': [
        {'text': "The boy is wearing glasses", 'score': 0},
        {'text': "The man is giving something to the boy", 'score': 1},
        {'text': 'The man is thanking the boy', 'score': 0},
        {'text': "The boy is giving something to the man", 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question':
          '7. Look at the picture and then choose the correct statement.',
      'image': 'assets/pumpkin.jpg',
      'answers': [
        {'text': "It is a cold and rainy day", 'score': 0},
        {'text': "They are standing in front of a large orange", 'score': 0},
        {'text': 'They are standing in front of a large pumpkin', 'score': 1},
        {'text': "There are six girls in the picture", 'score': 0},
      ],
    },
    {
      'categoryId': 2,
      'question':
          '8. Look at the picture and then choose the correct statement.',
      'image': 'assets/copOfLove.jpg',
      'answers': [
        {'text': "The shop closes at 7pm", 'score': 1},
        {'text': "The shop closes at 7am", 'score': 0},
        {'text': 'The shop closes at 19:00pm', 'score': 0},
        {'text': "The shop closes at 9pm", 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question': '1. Osmanlı İmparatorluğu kaç yıl boyunca hüküm sürmüştür?',
      'answers': [
        {'text': '624', 'score': 1},
        {'text': '670', 'score': 0},
        {'text': '523', 'score': 0},
        {'text': '615', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question': '2. 2.Dünya Savaşı kaç sene sürmüştür?',
      'answers': [
        {'text': '3', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '5', 'score': 0},
        {'text': '6', 'score': 1},
      ],
    },
    {
      'categoryId': 3,
      'question': '3. Türklerde ilk düzenli orduyu kim kurmuştur?',
      'answers': [
        {'text': 'Mete Han', 'score': 1},
        {'text': 'Orhan Bey', 'score': 0},
        {'text': 'Teoman', 'score': 0},
        {'text': 'Cengiz Han', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question': '4. Ankara Savaşı kaç yılında gerçekleşmiştir?',
      'answers': [
        {'text': '1520', 'score': 0},
        {'text': '1414', 'score': 0},
        {'text': '1402', 'score': 1},
        {'text': '1398', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question':
          '5. Büyük Selçuklu Devleti hangi savaş sonucunda kurulmuştur?',
      'answers': [
        {'text': 'Dandanakan', 'score': 1},
        {'text': 'Ankara', 'score': 0},
        {'text': 'Sazlıdere', 'score': 0},
        {'text': 'Çirmen', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question':
          "6. 23 Nisan 1920'de Türkiye Büyük Millet Meclisi'nin açılmasıyla hangisinin görevi sona ermiştir?",
      'answers': [
        {'text': 'İstiklal Mahkemeleri', 'score': 0},
        {'text': 'Kuvayımilliye', 'score': 0},
        {'text': 'Temsil heyeti', 'score': 1},
        {'text': 'Cemiyetler', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question':
          '7. Mondros Ateşkes Antlaşması sonrasında İngilizler tarafından işgal edilen ilk Osmanlı toprağı hangisidir?',
      'answers': [
        {'text': 'Batum', 'score': 0},
        {'text': 'Antalya', 'score': 0},
        {'text': 'Musul', 'score': 1},
        {'text': 'Samsun', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question': '8. Mondros Ateşkes Antlaşması hangi yılda imzalanmıştır?',
      'image': 'assets/mondros.webp',
      'answers': [
        {'text': '1919', 'score': 0},
        {'text': '1915', 'score': 0},
        {'text': '1918', 'score': 1},
        {'text': '1923', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question':
          "9. Osmanlı Dönemi'nde hangi padişah yeniçeriler tarafından boğularak öldürülmüştür?",
      'answers': [
        {'text': 'Genç Osman', 'score': 1},
        {'text': 'Sarı Selim', 'score': 0},
        {'text': 'IV.Mehmet', 'score': 0},
        {'text': 'Fatih Sultan Mehmet', 'score': 0},
      ],
    },
    {
      'categoryId': 3,
      'question':
          '10. Malazgirt Meydan Muharebesi Selçuklular ile hangi devlet arasında gerçekleşmişitir?',
      'answers': [
        {'text': 'Peçenekler', 'score': 0},
        {'text': 'Yunan', 'score': 0},
        {'text': 'Karahitaylar', 'score': 0},
        {'text': 'Bizans', 'score': 1},
      ],
    },
    {
      'categoryId': 4,
      'question': '5. Which of the following is not a football player?',
      'answers': [
        {'text': 'Zimbabve', 'score': 1},
        {'text': 'Pepe', 'score': 0},
        {'text': 'Mbappe', 'score': 0},
        {'text': 'Mahmut', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': "1. 2018 Dünya Kupası'nı hangi ülke kazandı?",
      'image': 'assets/worldCup.jpg',
      'answers': [
        {'text': 'Almanya', 'score': 0},
        {'text': 'Brazilya', 'score': 0},
        {'text': 'Fransa', 'score': 1},
        {'text': 'Arjantin', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': '2. Hangi spor "sporun kralı" olarak kabul edilir?',
      'answers': [
        {'text': 'Basketbol', 'score': 0},
        {'text': 'Futbol', 'score': 1},
        {'text': 'Voleybol', 'score': 0},
        {'text': 'Tenis', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': "3. 1946'da ilk NBA maçını hangi takım kazandı?",
      'answers': [
        {'text': 'New York Knicks', 'score': 1},
        {'text': 'Los Angeles Lakers', 'score': 0},
        {'text': 'Philadelphia 76ers', 'score': 0},
        {'text': 'Brooklyn Nets', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': "4. Bir beyzbol takımında kaç oyuncu bulunur?",
      'image': 'assets/beyzbol.webp',
      'answers': [
        {'text': '6', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '9', 'score': 1},
        {'text': '7', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question':
          "5. Cep Herkülü olarak da tanınan Türk haltercimizin adı nedir?",
      'image': 'assets/halter.webp',
      'answers': [
        {'text': 'Nuray Güngör', 'score': 0},
        {'text': 'Naim Süleymanoğlu', 'score': 1},
        {'text': 'Erol Bilgin', 'score': 0},
        {'text': 'Sedat Artuç', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question':
          "6. Olimpiyat halkalarında kırmızı renk hangisini temsil eder?",
      'image': 'assets/olimpiyat.webp',
      'answers': [
        {'text': 'Afrika', 'score': 0},
        {'text': 'Avrupa', 'score': 0},
        {'text': 'Asya', 'score': 0},
        {'text': 'Amerika', 'score': 1},
      ],
    },
    {
      'categoryId': 5,
      'question': "7. Dünya Kupası'nı ilk kazanan ülke hangisidir?",
      'answers': [
        {'text': 'Almanya', 'score': 0},
        {'text': 'Uruguay', 'score': 1},
        {'text': 'Arjantin', 'score': 0},
        {'text': 'Türkiye', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': "8. Hangisi masa tenisi ile ilgili bir terim değildir?",
      'image': 'assets/tenis.gif',
      'answers': [
        {'text': 'Servis', 'score': 0},
        {'text': 'Forehand', 'score': 0},
        {'text': 'Ribaund', 'score': 1},
        {'text': 'Backhand', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question': "9. 400 metre engelli koşuda kaç adet engel bulunur?",
      'answers': [
        {'text': '16', 'score': 0},
        {'text': '10', 'score': 1},
        {'text': '20', 'score': 0},
        {'text': '12', 'score': 0},
      ],
    },
    {
      'categoryId': 5,
      'question':
          "10. Basketbolda bir sporcu topu sektirmeden topla beraber en fazla kaç adım atabilir?",
      'image': 'assets/basket.gif',
      'answers': [
        {'text': '3', 'score': 0},
        {'text': '1', 'score': 0},
        {'text': 'Atamaz', 'score': 0},
        {'text': '2', 'score': 1},
      ],
    },
    {
      'categoryId': 6,
      'question': "1. Allahuekber dağları Türkiye'nin hangi bölgesindedir?",
      'image': 'assets/allahuekber.webp',
      'answers': [
        {'text': 'Güneydoğu Anadolu Bölgesi', 'score': 0},
        {'text': 'Akdeniz Bölgesi', 'score': 0},
        {'text': 'Doğu Anadolu Bölgesi', 'score': 1},
        {'text': 'Karadeniz Bölgesi', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "2. Tuz Gölünün hangi illerimizde kıyısı yoktur?",
      'answers': [
        {'text': 'Niğde', 'score': 1},
        {'text': 'Ankara', 'score': 0},
        {'text': 'Konya', 'score': 0},
        {'text': 'Aksaray', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "3. Alüvyon hangisiyle alakalı bir terimdir?",
      'answers': [
        {'text': 'Dağ', 'score': 0},
        {'text': 'Hava', 'score': 0},
        {'text': 'Deprem', 'score': 0},
        {'text': 'Akarsu', 'score': 1},
      ],
    },
    {
      'categoryId': 6,
      'question': "4. Hangi iki ilimiz komşudur?",
      'image': 'assets/harita.webp',
      'answers': [
        {'text': 'Çorum - Ankara', 'score': 0},
        {'text': 'Rize - Erzurum', 'score': 1},
        {'text': 'İstanbul - Yalova', 'score': 0},
        {'text': 'Kırıkkale - Nevşehir', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question':
          "5. Maki daha çok hangi bölgemizde görülen bir bitki örtüsüdür?",
      'image': 'assets/maki.webp',
      'answers': [
        {'text': 'İç Anadolu Bölgesi', 'score': 0},
        {'text': 'Marmara Bölgesi', 'score': 0},
        {'text': 'Akdeniz Bölgesi', 'score': 1},
        {'text': 'Karadeniz Bölgesi', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "6. Aşağıdaki ülkelerden hangisi Avrupa'dadır?",
      'answers': [
        {'text': 'Yeni Zelanda', 'score': 0},
        {'text': 'Avusturya', 'score': 1},
        {'text': 'Ermenistan', 'score': 0},
        {'text': 'Avustralya', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "7. Aşağıdaki şehirlerden hangisi bir başkenttir?",
      'answers': [
        {'text': 'Abu Dabi', 'score': 1},
        {'text': 'New York', 'score': 0},
        {'text': 'Cenevre', 'score': 0},
        {'text': 'Liverpool', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "8. Hangi iki ülke birbiriyle komşudur?",
      'image': 'assets/dünya.webp',
      'answers': [
        {'text': 'Danimarka - Norveç', 'score': 0},
        {'text': 'Brezilya - Şili', 'score': 0},
        {'text': 'Mısır - İsrail', 'score': 1},
        {'text': 'Fas - Tunus', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "9. Hangi nehir Güney Amerika'dadır?",
      'image': 'assets/river.gif',
      'answers': [
        {'text': 'Amazon', 'score': 1},
        {'text': 'Nil', 'score': 0},
        {'text': 'Mississippi', 'score': 0},
        {'text': 'Obi', 'score': 0},
      ],
    },
    {
      'categoryId': 6,
      'question': "10. Everest Dağı hangi iki ülkenin sınırı üstünde yer alır?",
      'image': 'assets/everest.gif',
      'answers': [
        {'text': 'Çin - Hindistan', 'score': 0},
        {'text': 'Çin - Nepal', 'score': 1},
        {'text': 'Hindistan - Afganistan', 'score': 0},
        {'text': 'Hindistan - Nepal', 'score': 0},
      ],
    },
    {
      'categoryId': 7,
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
      'categoryId': 8,
      'question':
          '1. Uyurken birbirlerinden ayrı düşmemek için el ele tutuşan hayvan hangisidir?',
      'answers': [
        {'text': 'Penguen', 'score': 0},
        {'text': 'Su samuru', 'score': 1},
        {'text': 'Panda', 'score': 0},
        {'text': 'Ayı', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question':
          '2. Toprağın altına sakladıkları meşe palamutlarını nereye koyduklarını unuttukları için her yıl binlerce ağacın yetişmesine neden olan hayvan hangisidir?',
      'answers': [
        {'text': 'Sincap', 'score': 1},
        {'text': 'Kunduz', 'score': 0},
        {'text': 'Tavşan', 'score': 0},
        {'text': 'Fare', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question':
          '3. Hangi hayvanların burun izleri, insanların parmak izleri gibi eşsizdir ve birbirlerinin kimliklerini bu şekilde tespit ederler?',
      'answers': [
        {'text': 'At', 'score': 0},
        {'text': 'Kaplumbağa', 'score': 0},
        {'text': 'Kedi', 'score': 0},
        {'text': 'Köpek', 'score': 1},
      ],
    },
    {
      'categoryId': 8,
      'question': '4. Hangi hayvanın tat alma duyuları ayaklarındadır?',
      'answers': [
        {'text': 'Sinek', 'score': 0},
        {'text': 'Uğur böceği', 'score': 0},
        {'text': 'Kelebek', 'score': 1},
        {'text': 'Arı', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question':
          '5. 805 km uzaktan algılanabilen alçak frekansta ses dalgaları üreten en gürültücü memeli hangisidir?',
      'answers': [
        {'text': 'Mavi balina', 'score': 1},
        {'text': 'Fil', 'score': 0},
        {'text': 'Goril', 'score': 0},
        {'text': 'Aslan', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question': '6. Görseldeki hayvan hangisidir?',
      'image': 'assets/glaucus.jpg',
      'answers': [
        {'text': 'Glaucus Atlanticus', 'score': 1},
        {'text': 'Chrysopelea', 'score': 0},
        {'text': 'Blobfish', 'score': 0},
        {'text': 'Enypniastes', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question': '7. Dünyanın en küçük memeli hayvanı hangisidir?',
      'answers': [
        {'text': 'Pigme Arap tavşanı', 'score': 0},
        {'text': 'Cüce böcekçil', 'score': 0},
        {'text': 'Keseli pigme sıçanı', 'score': 0},
        {'text': 'Yabanarısı yarasası', 'score': 1},
      ],
    },
    {
      'categoryId': 8,
      'question':
          '8. Hangisi rejenerasyon ile kendini yenileyebilen bir hayvan değildir?',
      'image': 'assets/yenileme.webp',
      'answers': [
        {'text': 'Deniz yıldızı', 'score': 0},
        {'text': 'Deniz atı', 'score': 1},
        {'text': 'Toprak solucanı', 'score': 0},
        {'text': 'Kertenkele', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question': '9. Hangi hayvan türü otçuldur?',
      'image': 'assets/hayvanlar.jpg',
      'answers': [
        {'text': 'Geyik', 'score': 1},
        {'text': 'Fare', 'score': 0},
        {'text': 'Tilki', 'score': 0},
        {'text': 'Maymun', 'score': 0},
      ],
    },
    {
      'categoryId': 8,
      'question': '10. Videoda ki hayvan hangisidir?',
      'image': 'assets/okapi.gif',
      'answers': [
        {'text': 'Pyura Chilensis', 'score': 0},
        {'text': 'Gerenuk', 'score': 0},
        {'text': 'Okapi', 'score': 1},
        {'text': 'Patagonian Mara', 'score': 0},
      ],
    },
    {
      'categoryId': 9,
      'question': '10. Kratos is the main character of what video game series?',
      'answers': [
        {'text': "Assassin's Creed", 'score': 0},
        {'text': 'Hitman', 'score': 0},
        {'text': 'Call of Duty', 'score': 0},
        {'text': 'God of War', 'score': 1},
      ],
    },
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
          if (question.containsKey('image'))
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(question['image'] as String),
            ),
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
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 17),
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
    return Center(
      child: Container(
        width: 200.0,
        margin: const EdgeInsets.all(10),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: const StadiumBorder(),
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
        title: const Text('Quiz'),
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
                      ((100 / questions.length) * score).toInt() >= 50
                          ? "assets/passed.png"
                          : "assets/failed.png"),
                ),
              ),
            ),
            Text(
              'You scored ${((100 / questions.length) * score).toInt()}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: resetQuiz,
              child: const Text('Reset quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
