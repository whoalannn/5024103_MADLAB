import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const QuizPage(),
      );
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questions = const [
    {'q': 'Which language is used by Flutter?', 'options': ['Java', 'Dart', 'Python'], 'answer': 'Dart'},
    {'q': 'Which widget arranges children vertically?', 'options': ['Row', 'Stack', 'Column'], 'answer': 'Column'},
    {'q': 'Which function starts a typical Flutter app?', 'options': ['main()', 'start()', 'run()'], 'answer': 'main()'},
  ];
  int index = 0;
  int score = 0;
  bool finished = false;

  void choose(String answer) {
    if (answer == questions[index]['answer']) score++;
    setState(() {
      if (index == questions.length - 1) {
        finished = true;
      } else {
        index++;
      }
    });
  }

  void restart() => setState(() {
        index = 0;
        score = 0;
        finished = false;
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Flutter Quiz')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: finished
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Your score: $score / ${questions.length}',
                          style: const TextStyle(fontSize: 26)),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: restart, child: const Text('Try Again')),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Question ${index + 1} of ${questions.length}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 16),
                    Text(questions[index]['q']!,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    ...(questions[index]['options'] as List<String>).map(
                      (option) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          onPressed: () => choose(option),
                          child: Text(option),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      );
}
