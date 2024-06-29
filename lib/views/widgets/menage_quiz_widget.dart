import 'package:firebase_quiz/controllers/quiz_controller.dart';
import 'package:firebase_quiz/models/quiz_models.dart';
import 'package:flutter/material.dart';

class ManageQuizWidget extends StatefulWidget {
  final bool isEdit;
  final Question? question;
  final QuizController quizController;

  const ManageQuizWidget({
    super.key,
    required this.isEdit,
    this.question,
    required this.quizController,
  });

  @override
  State<ManageQuizWidget> createState() => _ManageQuizWidgetState();
}

class _ManageQuizWidgetState extends State<ManageQuizWidget> {
  final List<TextEditingController> _list = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? 'Edit quiz' : 'Add Quiz'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _list[0],
          ),
          TextField(
            controller: _list[1],
          ),
          TextField(
            controller: _list[2],
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              // if (widget.isEdit) {
              //   widget.quizController.editQuiz(
              //     quiz: Question(id: id, questionText: questionText, options: options, correctAnswerIndex: correctAnswerIndex)
              //   );
              // } else {
              //   widget.quizController.addQuiz(
              //     question: _list[0].text,
              //     options: _list[1]
              //         .text
              //         .split(',')
              //         .map(
              //           (e) => e.trim(),
              //         )
              //         .toList(),
              //     correctAnswer: int.parse(_list[2].text),
              //   );
              // }
              Navigator.of(context).pop();
            },
            child: const Text('Save')),
      ],
    );
  }
}
//options: List<String>.from(
//         query['options'].map((dynamic item) => item as String),
//       ),