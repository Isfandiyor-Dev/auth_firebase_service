import 'package:auth_firebase_service/services/quiz_firebase_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class QuizController extends ChangeNotifier {
  final _quizFirebaseServices = QuizFirebaseServices();

  List<Map<String, dynamic>> selectedAnswers = [];

  // check answers
  void onSelectedAnswers(
    String quizId,
    String selectedAnsId,
    String correctAnswer,
  ) {
    bool isCreated = false;
    for (var item in selectedAnswers) {
      if (item["quizId"] == quizId) {
        item["selectedAnsId"] = selectedAnsId;
        isCreated = true;
        break;
      }
    }
    if (!isCreated) {
      selectedAnswers.add({
        "quizId": quizId,
        "selectedAnsId": selectedAnsId,
        "correctAnswer": correctAnswer,
      });
    }
    for (var item in selectedAnswers) {
      print(item);
    }
    notifyListeners();
  }

  Map<String, dynamic> result() {
    int correctAnswers = 0;
    int wrongAswers = 0;
    for (var value in selectedAnswers) {
      if (value["selectedAnsId"] == value["correctAnswer"]) {
        correctAnswers++;
      } else {
        wrongAswers++;
      }
    }
    return {
      "correctAnswers": correctAnswers,
      "wrongAnswers": wrongAswers,
    };
  }

  String? getSelectedAnswer(String quizId) {
    for (var item in selectedAnswers) {
      if (item["quizId"] == quizId) {
        return item["selectedAnsId"];
      }
    }
    return null;
  }

  // crud
  Stream<QuerySnapshot> get list {
    return _quizFirebaseServices.getQuizzes();
  }

  void editTittleQuiz(String id, String title) {
    _quizFirebaseServices.editTittle(id, title);
  }
}
