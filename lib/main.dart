import 'package:flutter/material.dart';

void main() {
  runApp(SurveyApp());
}

class SurveyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Survey',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: SurveyScreen(),
    );
  }
}

class SurveyScreen extends StatefulWidget {
  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // Sample questions
  List<String> questions = [
    'How often do you watch YouTube videos?',
    'What types of content do you enjoy watching on YouTube?',
    'How important is video quality to you when watching YouTube videos?',
    // Add more questions here...
  ];

  // Sample answers
  Map<String, String> answers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Survey'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index]),
            subtitle: TextField(
              onChanged: (value) {
                setState(() {
                  answers[questions[index]] = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Type your answer here...',
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle submission of survey
          _submitSurvey();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  void _submitSurvey() {
    // Print answers for testing
    print(answers);

    // Navigate to results screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsScreen(answers: answers),
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  final Map<String, String> answers;

  ResultsScreen({required this.answers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Results'),
      ),
      body: ListView.builder(
        itemCount: answers.length,
        itemBuilder: (context, index) {
          String question = answers.keys.elementAt(index);
          String answer = answers.values.elementAt(index);
          return ListTile(
            title: Text(question),
            subtitle: Text(answer),
          );
        },
      ),
    );
  }
}
