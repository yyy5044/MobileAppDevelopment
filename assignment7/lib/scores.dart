import 'package:flutter/cupertino.dart';

class Scores with ChangeNotifier {
  int midTermExam = 30;
  int finalExam = 30;

  decreaseMidTerm(){
    midTermExam -= 1;
    notifyListeners();
  }

  increaseMidTerm(){
    midTermExam += 1;
    notifyListeners();
  }

  decreaseFinal(){
    finalExam -= 1;
    notifyListeners();
  }

  increaseFinal(){
    finalExam += 1;
    notifyListeners();
  }
}

class DetailedScores with ChangeNotifier {
  int additionalMidterm = 10;
  int additionalFinal = 10;
}