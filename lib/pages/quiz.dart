import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Apa yang menjadi penyebab penyakit Tuberkulosis (TBC)?',
      'answers': [
        {'text': 'Virus', 'score': 0},
        {'text': 'Bakteri', 'score': 10},
        {'text': 'Parasit', 'score': 0},
        {'text': 'Jamur', 'score': 0},
      ],
    },
    {
      'questionText':
          'Di mana bakteri penyebab TBC biasanya menyerang dalam tubuh manusia?',
      'answers': [
        {'text': 'Paru-paru', 'score': 10},
        {'text': 'Liver', 'score': 0},
        {'text': 'Jantung', 'score': 0},
        {'text': 'Otak', 'score': 0},
      ],
    },
    {
      'questionText': 'Bagaimana TBC dapat menyebar dari orang ke orang?',
      'answers': [
        {'text': 'Melalui gigitan serangga', 'score': 0},
        {'text': 'Melalui udara', 'score': 10},
        {'text': 'Melalui makanan yang terkontaminasi', 'score': 0},
        {'text': 'Melalui hubungan seksual', 'score': 0},
      ],
    },
    {
      'questionText': 'Apa gejala umum yang biasanya terkait dengan TBC?',
      'answers': [
        {'text': 'Sakit kepala', 'score': 0},
        {'text': 'Demam tinggi', 'score': 0},
        {'text': 'Gatal-gatal pada kulit', 'score': 0},
        {
          'text': 'Penurunan berat badan yang tidak dapat dijelaskan',
          'score': 10
        },
      ],
    },
    {
      'questionText':
          'Apa jenis tes yang biasa digunakan untuk mendeteksi TBC?',
      'answers': [
        {'text': 'Tes darah', 'score': 0},
        {'text': 'Tes urin', 'score': 0},
        {'text': 'Tes dahak', 'score': 10},
        {'text': 'Tes kencing', 'score': 0},
      ],
    },
    {
      'questionText':
          'Apa yang dimaksud dengan terapi DOTS dalam pengobatan TBC?',
      'answers': [
        {'text': 'Terapi herbal', 'score': 0},
        {'text': 'Terapi operasi', 'score': 0},
        {'text': 'Terapi antibiotik', 'score': 10},
        {'text': 'Terapi meditasi', 'score': 0},
      ],
    },
    {
      'questionText':
          'Berapa lama waktu pengobatan yang direkomendasikan untuk TBC?',
      'answers': [
        {'text': '1 minggu', 'score': 0},
        {'text': '2 minggu', 'score': 0},
        {'text': '6 bulan atau lebih', 'score': 10},
        {'text': '1 tahun', 'score': 0},
      ],
    },
    {
      'questionText': 'Apa yang dapat dilakukan untuk mencegah penyebaran TBC?',
      'answers': [
        {'text': 'Vaksinasi', 'score': 0},
        {'text': 'Hidup bersih dan sehat', 'score': 10},
        {'text': 'Menghindari kontak dengan penderita TBC', 'score': 0},
        {'text': 'Minum banyak air', 'score': 0},
      ],
    },
    {
      'questionText': 'Apa yang dimaksud dengan TBC resisten obat?',
      'answers': [
        {'text': 'TBC yang tidak dapat diobati', 'score': 0},
        {'text': 'TBC yang tidak dapat dideteksi', 'score': 0},
        {'text': 'TBC yang tidak dapat menular', 'score': 0},
        {
          'text': 'TBC yang tidak merespons terhadap obat-obatan standar',
          'score': 10
        },
      ],
    },
    {
      'questionText':
          'Apa yang dapat dilakukan untuk mendukung seseorang yang sedang menjalani pengobatan TBC?',
      'answers': [
        {'text': 'Memberikan dukungan emosional', 'score': 10},
        {'text': 'Memberikan obat-obatan tambahan', 'score': 0},
        {
          'text':
              'Menyarankan untuk berhenti minum obat jika sudah merasa sembuh',
          'score': 0
        },
        {'text': 'Mengabaikan kebutuhan mereka', 'score': 0},
      ],
    },
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score, String correctAnswer) {
    if (score == 10) {
      _showFeedback(true, correctAnswer);
    } else {
      _showFeedback(false, correctAnswer);
    }
  }

  void _showFeedback(bool isCorrect, String correctAnswer) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isCorrect ? 'Benar!' : 'Salah!'),
        content: Text(isCorrect
            ? 'Jawaban Anda benar.'
            : 'Jawaban Anda salah.\nJawaban yang benar adalah: $correctAnswer'),
        actions: <Widget>[
          TextButton(
            child: Text('Lanjut'),
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _questionIndex++;
              });
            },
          ),
        ],
      ),
    );

    if (isCorrect) {
      setState(() {
        _totalScore += 10;
      });
    }
  }

  // void _answerQuestion(int score) {
  //   setState(() {
  //     _totalScore += score;
  //     _questionIndex++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Game',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Poppins-Bold"),
        ),
        backgroundColor: Color(0xff354D5B),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore),
    );
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(int, String) answerQuestion;

  Quiz({
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        questions[questionIndex]['answers'] as List<Map<String, Object>>;
    String correctAnswer =
        answers.firstWhere((answer) => answer['score'] == 10)['text'] as String;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(
          questions[questionIndex]['questionText'] as String,
        ),
        ...answers.map((answer) {
          return Answer(
            () => answerQuestion(answer['score'] as int, correctAnswer),
            answer['text'] as String,
          );
        }).toList()
      ],
    );
  }
}

// class Quiz extends StatelessWidget {
//   final List<Map<String, Object>> questions;
//   final int questionIndex;
//   final Function answerQuestion;

//   Quiz({
//     required this.questions,
//     required this.questionIndex,
//     required this.answerQuestion,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Question(
//           questions[questionIndex]['questionText'] as String,
//         ),
//         ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
//             .map((answer) {
//           return Answer(
//             () => answerQuestion(answer['score']),
//             answer['text'] as String,
//           );
//         }).toList()
//       ],
//     );
//   }
// }

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins-Bold",
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final void Function() selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xff354D5B),
          onPrimary: Colors.white,
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: "Adigiana",
          ),
        ),
        onPressed: selectHandler,
      ),
    );
  }
}

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Kuis Selesai!',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins-Bold",
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Skor Anda: $resultScore /100',
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            child: Text(
              'Restart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "Adigiana",
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff354D5B),
                onPrimary: Colors.white,
                minimumSize: Size(150, 50)),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
