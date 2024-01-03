// import 'dart:math';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:uap_mobile1/app/const.dart';
// import 'package:uap_mobile1/app/modules/util/my_button.dart';
// import 'package:uap_mobile1/app/modules/util/result_message.dart';

// class GamePage extends StatefulWidget {
//   const GamePage({Key? key}) : super(key: key);

//   @override
//   State<GamePage> createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   List<String> numberPad = [
//     '7',
//     '8',
//     '9',
//     'C',
//     '4',
//     '5',
//     '6',
//     'DEL',
//     '1',
//     '2',
//     '3',
//     '=',
//     '0',
//     '+',
//     '-',
//     '*',
//     '/',
//     '.',
//   ];

//   int numberA = 1;
//   int numberB = 1;
//   String operator = '+';
//   String userAnswer = '';

//   void buttonTapped(String button) {
//     setState(() {
//       if (button == '=') {
//         checkResult();
//       } else if (button == 'C') {
//         userAnswer = '';
//       } else if (button == 'DEL') {
//         if (userAnswer.isNotEmpty) {
//           userAnswer = userAnswer.substring(0, userAnswer.length - 1);
//         }
//       } else if (button == '.' && !userAnswer.contains('.')) {
//         userAnswer += button;
//       } else if (button == '-' && userAnswer.isEmpty) {
//         // Handle input of negative sign when the answer is empty
//         userAnswer = '-';
//       } else if (userAnswer.length < 5) {
//         if (button == '+' || button == '-' || button == '*' || button == '/') {
//           operator = button;
//         } else {
//           userAnswer += button;
//         }
//       }
//     });
//   }

//   void checkResult() {
//     double correctAnswer = 0.0;

//     switch (operator) {
//       case '+':
//         correctAnswer = (numberA.toDouble() + numberB.toDouble());

//         break;
//       case '-':
//         correctAnswer = (numberA.toDouble() - numberB.toDouble());

//         break;
//       case '*':
//         correctAnswer = (numberA.toDouble() * numberB.toDouble());

//         break;
//       case '/':
//         if (numberB != 0) {
//           correctAnswer = (numberA / numberB).toDouble();
//           correctAnswer = double.parse(correctAnswer.toStringAsFixed(2));
//         } else {
//           // Handle division by zero
//           showDialog(
//             context: context,
//             builder: (context) {
//               return ResultMessage(
//                 message: 'Cannot divide by zero!',
//                 onTap: goBackToQuestion,
//                 icon: Icons.rotate_left,
//               );
//             },
//           );
//           return;
//         }
//         break;
//       default:
//         return;
//     }

//     if ((correctAnswer == double.parse(userAnswer)) ||
//         (correctAnswer == -double.parse(userAnswer))) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return ResultMessage(
//             message: 'Correct!',
//             onTap: goToNextQuestion,
//             icon: Icons.arrow_forward,
//           );
//         },
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return ResultMessage(
//             message: 'Sorry, try again',
//             onTap: goBackToQuestion,
//             icon: Icons.rotate_left,
//           );
//         },
//       );
//     }
//   }

//   var randomNumber = Random();

//   void goToNextQuestion() {
//     Navigator.of(context).pop();

//     setState(() {
//       userAnswer = '';
//     });

//     int operation = randomNumber.nextInt(4);
//     numberA = randomNumber.nextInt(10);
//     numberB = randomNumber.nextInt(10);

//     switch (operation) {
//       case 0:
//         operator = '+';
//         break;
//       case 1:
//         operator = '-';
//         break;
//       case 2:
//         operator = '*';
//         break;
//       case 3:
//         operator = '/';
//         // avoid division by zero
//         numberB = randomNumber.nextInt(9) + 1;
//         break;
//       default:
//         break;
//     }
//   }

//   void goBackToQuestion() {
//     Navigator.of(context).pop();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepOrange[300],
//       body: Column(
//         children: [
//           Container(
//             height: 100,
//             color: Colors.deepPurple[400],
//           ),
//           Expanded(
//             child: Container(
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '$numberA $operator $numberB = ',
//                       style: whiteTextStyle,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 150, // Ubah lebar kolom jawaban sesuai kebutuhan
//                       decoration: BoxDecoration(
//                         color: Colors.deepPurple[400],
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Center(
//                         child: Text(
//                           userAnswer,
//                           style: whiteTextStyle,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: GridView.builder(
//                 itemCount: numberPad.length,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4,
//                   childAspectRatio: 1.6,
//                 ),
//                 itemBuilder: (context, index) {
//                   return MyButton(
//                     child: numberPad[index],
//                     onTap: () => buttonTapped(numberPad[index]),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:uap_mobile1/app/modules/Appwrite/controllers/leaderboard_controller.dart';

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
    '-',
    '0',
    '.',
  ];

  int numberA = 1;
  int numberB = 1;
  String operator = '+';
  String userAnswer = '';
  int score = 0;

  late Timer timer;
  int timerSeconds = 60;

  final LeaderboardController leaderboardController = LeaderboardController();

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    generateQuestion();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--;
        } else {
          t.cancel();
          endGame();
        }
      });
    });
  }

  void endGame() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('Your score: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                leaderboardController.addUserToLeaderboard(
                    'placeholderUsername', score);
                resetGame();
              },
              child: Text('Play Again'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      userAnswer = '';
      score = 0;
      timerSeconds = 60;
    });

    startGame();
  }

  void generateQuestion() {
    int operation = Random().nextInt(4);
    numberA = Random().nextInt(10);
    numberB = Random().nextInt(10);

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
        numberB = Random().nextInt(9) + 1;
        break;
      default:
        break;
    }
  }

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
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Cannot divide by zero!'),
                actions: [
                  TextButton(
                    onPressed: goBackToQuestion,
                    child: Text('OK'),
                  ),
                ],
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
          return AlertDialog(
            title: Text('Correct!'),
            actions: [
              TextButton(
                onPressed: goToNextQuestion,
                child: Text('Next Question'),
              ),
            ],
          );
        },
      );
      score++;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sorry, try again'),
            actions: [
              TextButton(
                onPressed: goBackToQuestion,
                child: Text('Try Again'),
              ),
            ],
          );
        },
      );
    }
  }

  void goToNextQuestion() {
    Navigator.of(context).pop();

    setState(() {
      userAnswer = '';
    });

    generateQuestion();
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
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[400],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          userAnswer,
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
                  return ElevatedButton(
                    onPressed: () => buttonTapped(numberPad[index]),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[400],
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      numberPad[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 50,
            color: Colors.deepOrange[300],
            child: Center(
              child: Text(
                'Time: $timerSeconds seconds | Score: $score',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
