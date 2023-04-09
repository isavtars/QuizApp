import 'questions_banks.dart';

class QuizeBrain {
  int _qusetionsnum = 0;
//Encpaculations
  List<Qusestion> _quetionbank = [
    Qusestion(qtext: "1: Dart is objecta oriented langauges", qanswer: true),
    Qusestion(
        qtext: "2: Dart does not support access modifiers such as public.",
        qanswer: false),
    Qusestion(
        qtext:
            "3: Spread operator can be used to concatenate lists, sets, and maps.",
        qanswer: true),
    Qusestion(qtext: "4: Dart is objecta oriented langauges", qanswer: true),
    Qusestion(
        qtext: "5: Dart does not support access modifiers such as public.",
        qanswer: false),
    Qusestion(
        qtext:
            "6: Spread operator can be used to concatenate lists, sets, and maps.",
        qanswer: true),
  ];

  void nextQusetion() {
    if (_qusetionsnum < _quetionbank.length - 1) {
      _qusetionsnum++;
    }
  }

  String getQuestion() {
    return _quetionbank[_qusetionsnum].qtext;
  }

  bool getCorrectAnswer() {
    return _quetionbank[_qusetionsnum].qanswer;
  }

  bool isFinneshed() {
    if (_qusetionsnum >= _quetionbank.length - 1) {
      print("now returning true $_qusetionsnum ");
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qusetionsnum = 0;
  }
}
