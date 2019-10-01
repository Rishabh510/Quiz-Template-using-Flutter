import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

class _MyAppState extends State<MyApp> {
  //_makes the class, var, or method private and can be changed only from dart file
  var _qIndex = 0;
  final _questions = [
    const {
      "questionText": "what's your fav color?",
      "answers": [
        {
          'text': "red",
          'score': 10,
        },
        {
          'text': "blue",
          'score': 15,
        },
        {
          'text': "black",
          'score': 20,
        },
        {
          'text': "white",
          'score': 5,
        },
      ],
    },
    {
      "questionText": "what's your fav animal?",
      "answers": [
        {
          'text': "Bhalu",
          'score': 5,
        },
        {
          'text': "cheetah",
          'score': 5,
        },
        {
          'text': "genda",
          'score': 5,
        },
        {
          'text': "kutta",
          'score': 0,
        },

      ],
    },
    {
      "questionText": "what's your fav game?",
      "answers": [
        {
          'text': "control",
          'score': 20,
        },
        {
          'text': "mario",
          'score': 5,
        },
        {
          'text': "pubg",
          'score': 10,
        },
        {
          'text': "csgo",
          'score': 15,
        },
      ],
    },
  ];
  var _tscore = 0;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0; _tscore = 0;
    });
  }
  void _answerQuestion(int score) {
    _tscore += score;
    setState(() {
      _qIndex++;
    });
    print(_qIndex);
    if (_qIndex < _questions.length) {
      print("we have more questions");
    } else {
      print("no more questions");
    }
  } // to change internal state we use stateful widgets

  @override //automatically initialised - we r overriding build widget by our own function
  Widget build(BuildContext context) {
    // context is object of class BuildContext

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first APP(Quiz)"),
        ),
        body: _qIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                qIndex: _qIndex,
                questions: _questions,
              )
            : Result(_tscore, _resetQuiz),
      ),
    );
  }
}

void main() {
  runApp(
      MyApp()); //runApp is function that calls Widget build from main function
}

//void main() => runApp(MyApp()); //for 1 line functions

class MyApp extends StatefulWidget {
  // stateless is rerendered every time
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}
