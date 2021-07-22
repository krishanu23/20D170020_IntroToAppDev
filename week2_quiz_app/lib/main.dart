import 'package:flutter/material.dart';
import 'question_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  QuestionBank questionBank = QuestionBank();
  int questionIndex = 0;
  late bool correctAnswer;

  void updateQuestion (bool userChoice) {
    if(userChoice == correctAnswer){
      setState(() {
        scoreIcon.add(Icon(Icons.check, size: 40, color: Colors.green,));
        questionIndex++;
        lastQuestion();
      });
      print(true);
    }
    else{
      setState(() {
        scoreIcon.add(Icon(Icons.close, size: 40, color: Colors.red,));
        questionIndex++;
        lastQuestion();
      });
      print(false);
    }
  }
  void lastQuestion (){
    if(questionIndex == questionBank.questionBrain.length){
      setState(() {
        questionIndex =0;
        scoreIcon = [];
      });
    }
  }

  List<Icon> scoreIcon =[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 5,
                    child: Center(
                      child: Text(
                        questionBank.questionBrain[questionIndex].questionText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: TextButton(
                      onPressed: () {
                        correctAnswer = questionBank.questionBrain[questionIndex].questionAnswer;
                        updateQuestion(true);
                      },
                    child: Text('True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: TextButton(
                      onPressed: () {
                        correctAnswer = questionBank.questionBrain[questionIndex].questionAnswer;
                        updateQuestion(false);
                      },
                      child: Text('False',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: scoreIcon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
