// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../model/lesson_question.dart';
// import 'bloc/question_bloc.dart';
//
// class QuestionPage extends StatefulWidget {
//   static const routeName = '/question';
//
//   const QuestionPage({super.key});
//
//   @override
//   State<QuestionPage> createState() => _QuestionPageState();
// }
//
// class _QuestionPageState extends State<QuestionPage> {
//   late QuestionBloc _questionBloc;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final lessonId = ModalRoute.of(context)!.settings.arguments as int;
//     _questionBloc = BlocProvider.of<QuestionBloc>(context);
//     _questionBloc.add(GetQuestionListEvent(lessonId));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Practice'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: BlocBuilder<QuestionBloc, QuestionState>(
//           builder: (context, state) {
//             if (state is QuestionLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is QuestionError) {
//               return Center(child: Text('Error: ${state.error}'));
//             } else if (state is GetQuestionSuccess) {
//               List<LessonQuestion> questions = state.listQuestion;
//               List<int?> selectedAnswers = List.generate(questions.length, (index) => null);
//
//               void _onAnswerSelected(int questionIndex, int answerIndex) {
//                 setState(() {
//                   selectedAnswers[questionIndex] = answerIndex;
//                 });
//               }
//
//               int _calculateScore() {
//                 int score = 0;
//                 for (int i = 0; i < questions.length; i++) {
//                   if (selectedAnswers[i] != null && selectedAnswers[i] == _getCorrectAnswerIndex(questions[i].correctOption)) {
//                     score++;
//                   }
//                 }
//                 return score;
//               }
//
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: questions.length,
//                       itemBuilder: (context, index) {
//                         return Card(
//                           margin: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   questions[index].question,
//                                   style: const TextStyle(
//                                       fontSize: 18, fontWeight: FontWeight.bold),
//                                 ),
//                                 const SizedBox(height: 10),
//                                 ...List.generate(4, (answerIndex) {
//                                   String optionText;
//                                   switch (answerIndex) {
//                                     case 0:
//                                       optionText = questions[index].optionA;
//                                       break;
//                                     case 1:
//                                       optionText = questions[index].optionB;
//                                       break;
//                                     case 2:
//                                       optionText = questions[index].optionC;
//                                       break;
//                                     case 3:
//                                       optionText = questions[index].optionD;
//                                       break;
//                                     default:
//                                       optionText = '';
//                                   }
//                                   return RadioListTile<int>(
//                                     value: answerIndex,
//                                     groupValue: selectedAnswers[index],
//                                     onChanged: (value) {
//                                       _onAnswerSelected(index, value!);
//                                     },
//                                     title: Text(optionText),
//                                   );
//                                 }),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       int score = _calculateScore();
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             title: const Text('Kết quả'),
//                             content: Text('Điểm của bạn là: $score/${questions.length}'),
//                             actions: <Widget>[
//                               TextButton(
//                                 child: const Text('OK'),
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: const Text('Submit'),
//                   ),
//                 ],
//               );
//             } else {
//               return const Center(child: Text('No data available'));
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   int _getCorrectAnswerIndex(String correctOption) {
//     switch (correctOption) {
//       case 'A':
//         return 0;
//       case 'B':
//         return 1;
//       case 'C':
//         return 2;
//       case 'D':
//         return 3;
//       default:
//         return -1; // Trả về -1 nếu không có đáp án hợp lệ
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/lesson_question.dart';
import 'bloc/question_bloc.dart';

class QuestionPage extends StatefulWidget {
  static const routeName = '/question';

  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late QuestionBloc _questionBloc;
  late List<int?> selectedAnswers; // Đưa selectedAnswers vào initState

  @override
  void initState() {
    super.initState();
    selectedAnswers = []; // Khởi tạo selectedAnswers tại đây
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lessonId = ModalRoute.of(context)!.settings.arguments as int;
    _questionBloc = BlocProvider.of<QuestionBloc>(context);
    _questionBloc.add(GetQuestionListEvent(lessonId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<QuestionBloc, QuestionState>(
          builder: (context, state) {
            if (state is QuestionLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionError) {
              return Center(child: Text('Error: ${state.error}'));
            } else if (state is GetQuestionSuccess) {
              List<LessonQuestion> questions = state.listQuestion;

              // Khởi tạo selectedAnswers với độ dài của câu hỏi
              if (selectedAnswers.isEmpty) {
                selectedAnswers = List.generate(questions.length, (index) => null);
              }

              void _onAnswerSelected(int questionIndex, int answerIndex) {
                setState(() {
                  selectedAnswers[questionIndex] = answerIndex;
                });
              }

              int _calculateScore() {
                int score = 0;
                for (int i = 0; i < questions.length; i++) {
                  if (selectedAnswers[i] != null && selectedAnswers[i] == _getCorrectAnswerIndex(questions[i].correctOption)) {
                    score++;
                  }
                }
                return score;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questions[index].question,
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                ...List.generate(4, (answerIndex) {
                                  String optionText;
                                  switch (answerIndex) {
                                    case 0:
                                      optionText = questions[index].optionA;
                                      break;
                                    case 1:
                                      optionText = questions[index].optionB;
                                      break;
                                    case 2:
                                      optionText = questions[index].optionC;
                                      break;
                                    case 3:
                                      optionText = questions[index].optionD;
                                      break;
                                    default:
                                      optionText = '';
                                  }
                                  return RadioListTile<int>(
                                    value: answerIndex,
                                    groupValue: selectedAnswers[index],
                                    onChanged: (value) {
                                      _onAnswerSelected(index, value!);
                                    },
                                    title: Text(optionText),
                                  );
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      int score = _calculateScore();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Kết quả'),
                            content: Text('Điểm của bạn là: $score/${questions.length}'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  int _getCorrectAnswerIndex(String correctOption) {
    switch (correctOption) {
      case 'A':
        return 0;
      case 'B':
        return 1;
      case 'C':
        return 2;
      case 'D':
        return 3;
      default:
        return -1; // Trả về -1 nếu không có đáp án hợp lệ
    }
  }
}
