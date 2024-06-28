import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz/services/quiz_firebase_services.dart';
import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier{
  final _quizeFirebaseServices = QuizFirebaseServices();

  Stream<QuerySnapshot> get list {
    return _quizeFirebaseServices.getQuizes();
  }

  void addQuize(String questionText, List options, num correctAnswerIndex) {
    _quizeFirebaseServices.addQuiz(
      questionText,
      options,
      correctAnswerIndex,
    );
  }
}
