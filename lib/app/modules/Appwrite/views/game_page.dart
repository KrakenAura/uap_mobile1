import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uap_mobile1/app/const.dart';
import 'package:uap_mobile1/app/modules/util/my_button.dart';
import 'package:uap_mobile1/app/modules/util/result_message.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '+',
    '-',
    '*',
    '/',
    '.',
  ];

  int numberA = 1;
  int numberB = 1;
  String operator = '+';
  String userAnswer = '';

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        checkResult();
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (button == '.' && !userAnswer.contains('.')) {
        userAnswer += button;
      } else if (button == '-' && userAnswer.isEmpty) {
        // Handle input of negative sign when the answer is empty
        userAnswer = '-';
      } else if (userAnswer.length < 5) {
        if (button == '+' || button == '-' || button == '*' || button == '/') {
          operator = button;
        } else {
          userAnswer += button;
        }
      }
    });
  }

  void checkResult() {
    double correctAnswer = 0.0;

    switch (operator) {
      case '+':
        correctAnswer = (numberA.toDouble() + numberB.toDouble());

        break;
      case '-':
        correctAnswer = (numberA.toDouble() - numberB.toDouble());

        break;
      case '*':
        correctAnswer = (numberA.toDouble() * numberB.toDouble());

        break;
      case '/':
        if (numberB != 0) {
          correctAnswer = (numberA / numberB).toDouble();
          correctAnswer = double.parse(correctAnswer.toStringAsFixed(2));
        } else {
          // Handle division by zero
          showDialog(
            context: context,
            builder: (context) {
              return ResultMessage(
                message: 'Cannot divide by zero!',
                onTap: goBackToQuestion,
                icon: Icons.rotate_left,
              );
            },
          );
          return;
        }
        break;
      default:
        return;
    }

    if ((correctAnswer == double.parse(userAnswer)) ||
        (correctAnswer == -double.parse(userAnswer))) {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Correct!',
            onTap: goToNextQuestion,
            icon: Icons.arrow_forward,
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return ResultMessage(
            message: 'Sorry, try again',
            onTap: goBackToQuestion,
            icon: Icons.rotate_left,
          );
        },
      );
    }
  }

  var randomNumber = Random();

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    int operation = randomNumber.nextInt(4);
    numberA = randomNumber.nextInt(10);
    numberB = randomNumber.nextInt(10);

    switch (operation) {
      case 0:
        operator = '+';
        break;
      case 1:
        operator = '-';
        break;
      case 2:
        operator = '*';
        break;
      case 3:
        operator = '/';
        // avoid division by zero
        numberB = randomNumber.nextInt(9) + 1;
        break;
      default:
        break;
    }
  }

  void goBackToQuestion() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[300],
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.deepPurple[400],
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$numberA $operator $numberB = ',
                      style: whiteTextStyle,
                    ),
                    Container(
                      height: 50,
                      width: 150, // Ubah lebar kolom jawaban sesuai kebutuhan
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: whiteTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  return MyButton(
                    child: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
