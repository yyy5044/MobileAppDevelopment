import 'package:flutter/cupertino.dart';

class Member { // 학생 멤버의 정보
  final String studentName;
  final String studentNum;

  const Member({required this.studentNum, required this.studentName});
}

class Members with ChangeNotifier { // 학생 리스트는 프로바이더로 관리
  final List<Member> memberList = [];

  void addMembers(Member x){
    memberList.add(x);
    notifyListeners();
  }

  void removeMembers(int index){
    memberList.removeAt(index);
    notifyListeners();
  }
}