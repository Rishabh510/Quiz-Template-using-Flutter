import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  //getter
  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'You can still improve';
    } else if (resultScore <= 25) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 35) {
      resultText = 'You are great';
    } else {
      resultText = 'You are the best !!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
            child: Text("restart quiz"),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
