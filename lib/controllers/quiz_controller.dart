// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_quiz/services/quiz_firebase_services.dart';
// import 'package:flutter/material.dart';

// class QuizController extends ChangeNotifier {
//   final _quizeFirebaseServices = QuizFirebaseServices();

//   Stream<QuerySnapshot> get list {
//     return _quizeFirebaseServices.getQuizes();
//   }

//   void addQuiz(String questionText, List options, num correctAnswerIndex) {
//     _quizeFirebaseServices.addQuiz(
//       questionText,
//       options,
//       correctAnswerIndex,
//     );
//     notifyListeners();
//   }

//   void editQuiz(
//       String id, String questionText, List options, num correctAnswerIndex) {
//     _quizeFirebaseServices.editQuiz(
//       id,
//       questionText,
//       options,
//       correctAnswerIndex,
//     );
//   }

//   void deleteQuiz(String id) {
//     _quizeFirebaseServices.deleteQuiz(id);
//     notifyListeners();
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_quiz/services/quiz_firebase_services.dart';

class QuizController extends ChangeNotifier {
  final _quizFirebaseServices = QuizFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _quizFirebaseServices.getQuizzes();
  }

  Future<void> addQuiz(String questionText, List<String> options, int correctAnswerIndex) async {
    await _quizFirebaseServices.addQuiz(
      questionText,
      options,
      correctAnswerIndex,
    );
    notifyListeners();
  }

  Future<void> editQuiz(String id, String questionText, List<String> options, int correctAnswerIndex) async {
    await _quizFirebaseServices.editQuiz(
      id,
      questionText,
      options,
      correctAnswerIndex,
    );
    notifyListeners();
  }

  Future<void> deleteQuiz(String id) async {
    await _quizFirebaseServices.deleteQuiz(id);
    notifyListeners();
  }
}
