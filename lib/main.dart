 // ignore_for_file: prefer_const_constructors

import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var questions = '';
  var answers = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 197, 172, 243),
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.topLeft,
                      child: Text(
                        questions,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        answers,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    //clear  button
                    if (index == 0) {
                      return Buttons(Color.fromARGB(255, 9, 123, 12),
                          Colors.white, buttons[index], () {
                        setState(() {
                          questions = '';
                          answers = '';
                        });
                      });

                      //delete button
                    } else if (index == 1) {
                      return Buttons(
                        Color.fromARGB(255, 186, 35, 24),
                        Colors.white,
                        buttons[index],
                        () {
                          setState(
                            () {
                              questions =
                                  questions.substring(0, questions.length - 1);
                            },
                          );
                        },
                      );

                      //equal button
                    } else if (index == buttons.length - 1) {
                      return Buttons(
                        Color.fromARGB(255, 132, 2, 180),
                        Colors.white,
                        buttons[index],
                        () {
                          setState(
                            () {
                              equalPressed();
                            },
                          );
                        },
                      );

                      //answer button
                    } else if (index == buttons.length - 2) {
                      return Buttons(
                        Color.fromARGB(255, 132, 2, 180),
                        Colors.white,
                        buttons[index],
                        () {
                          setState(
                            () {
                              equalPressed();
                            },
                          );
                        },
                      );
                    } else {
                      return Buttons(
                          isOperator(buttons[index])
                              ? Color.fromARGB(255, 132, 2, 180)
                              : Colors.deepPurple[100],
                          isOperator(buttons[index])
                              ? Colors.white
                              : Color.fromARGB(255, 132, 2, 180),
                          buttons[index], () {
                        setState(() {
                          questions += buttons[index];
                        });
                      });
                    }
                  },
                )),
          ],
        ));
  }

  void equalPressed() {
    String finalQuestions = questions;
    finalQuestions = finalQuestions.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestions);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answers = eval.toString();
  }
}

bool isOperator(String x) {
  if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
    return true;
  } else {
    return false;
  }
}
