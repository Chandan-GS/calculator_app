import 'package:calculator_app/num_icons.dart';

import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  double result = 0;
  late String expression = '0';
  late String printExpression = expression;

  void nmFunction(String number) {
    setState(() {
      if (number == '*') {
        expression += '*';
        printExpression += 'x';
      } else {
        if (printExpression[0] != '0') {
          printExpression += number;
          expression += number;
        } else {
          printExpression = expression.substring(1, expression.length);
          printExpression += number;
          expression += number;
        }
      }
    });
  }

  void evaluateExpression() {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        result = eval;
      });
    } catch (e) {
      setState(() {
        expression = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 92, 92, 92),
              Color.fromARGB(255, 57, 57, 57),
              Color.fromARGB(255, 28, 28, 28),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   elevation: 0,
          //   backgroundColor: const Color.fromARGB(255, 81, 81, 81),
          //   title: const Text(
          //     'Calculator',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Color.fromARGB(252, 255, 159, 62),
          //       fontSize: 25,
          //     ),
          //   ),
          // ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '${result != 0 ? result.toDouble() : result.toInt()}',
                            style: const TextStyle(
                              fontSize: 40,
                              color: Color.fromARGB(252, 255, 159, 62),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: SizedBox(
                      height: 130,
                      // Adjust height dynamically
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            printExpression,
                            style: const TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 236, 236, 236),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                width: double.infinity,
                height: 450, // Adjust height dynamically
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumIcons(
                              numIcon: 'C',
                              func: () {
                                setState(() {
                                  result = 0;
                                  expression = '0';
                                  printExpression = '0';
                                });
                              },
                            ),
                            NumIcons(numIcon: '7', func: () => nmFunction('7')),
                            NumIcons(numIcon: '4', func: () => nmFunction('4')),
                            NumIcons(numIcon: '1', func: () => nmFunction('1')),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    printExpression = result.toString();
                                    expression = result.toString();
                                  });
                                },
                                style: ButtonStyle(
                                  shadowColor: const MaterialStatePropertyAll(
                                      Colors.black),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromARGB(251, 255, 144, 34)),
                                  elevation: const MaterialStatePropertyAll(2),
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(70, 70)),
                                  shape: MaterialStateProperty.all(
                                      const CircleBorder()),
                                ),
                                child: const Text(
                                  'ANS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: Color.fromARGB(240, 11, 11, 11),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SpecialElevatedButton(
                              specialIcon: Icons.backspace,
                              funcSpecialIcons: () {
                                setState(() {
                                  if (expression.isNotEmpty) {
                                    printExpression = printExpression.substring(
                                        0, printExpression.length - 1);
                                    expression = expression.substring(
                                        0, expression.length - 1);
                                    if (expression.isEmpty) {
                                      expression = '0';
                                      printExpression = '0';
                                    }
                                  }
                                });
                              },
                            ),
                            NumIcons(numIcon: '8', func: () => nmFunction('8')),
                            NumIcons(numIcon: '5', func: () => nmFunction('5')),
                            NumIcons(numIcon: '2', func: () => nmFunction('2')),
                            NumIcons(numIcon: '0', func: () => nmFunction('0')),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumIcons(numIcon: '/', func: () => nmFunction('/')),
                            NumIcons(numIcon: '9', func: () => nmFunction('9')),
                            NumIcons(numIcon: '6', func: () => nmFunction('6')),
                            NumIcons(numIcon: '3', func: () => nmFunction('3')),
                            NumIcons(numIcon: '.', func: () => nmFunction('.')),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumIcons(numIcon: 'x', func: () => nmFunction('*')),
                            NumIcons(numIcon: '-', func: () => nmFunction('-')),
                            NumIcons(numIcon: '+', func: () => nmFunction('+')),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    evaluateExpression(); // Evaluate first
                                  });
                                },
                                style: ButtonStyle(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Color.fromARGB(255, 255, 180, 100)),
                                  shadowColor: const MaterialStatePropertyAll(
                                      Colors.black),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Color.fromARGB(251, 255, 144, 34)),
                                  elevation: const MaterialStatePropertyAll(2),
                                  minimumSize: const MaterialStatePropertyAll(
                                      Size(70, 70 * 2 + (10))),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                                ),
                                child: const Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromARGB(240, 11, 11, 11),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
