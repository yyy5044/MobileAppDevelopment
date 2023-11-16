import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'memberlistpage.dart';
import 'members.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  TextEditingController inputStudentNum = TextEditingController();
  TextEditingController inputStudentName = TextEditingController();

  void dispose(){
    inputStudentNum.dispose();
    inputStudentName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MemberListPage()));
              },
              icon: const Icon(Icons.list))
        ],
        title: const Text('Add Team Member'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MemberPanel(),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  if(context.watch<Members>().memberList.length < 3){
                    return Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              const SizedBox(width: 20,),
                              const Text('Student No: ', style: TextStyle(fontSize: 16),),
                              Expanded(
                                child: TextField(
                                  controller: inputStudentNum,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(width: 20,),
                              const Text('Name: ', style: TextStyle(fontSize: 16),),
                              Expanded(
                                child: TextField(
                                  controller: inputStudentName,
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                              const SizedBox(width: 20,),
                            ],
                          ),
                          SizedBox(height: 40,),
                          ElevatedButton(onPressed: (){
                            if(inputStudentName.text.isNotEmpty && inputStudentNum.text.isNotEmpty){ // 입력란에 빈칸이 없으면
                              var member = Member(studentName: inputStudentName.text, studentNum: inputStudentNum.text); // 컨트롤러에 받은 텍스트로 객체 생성
                              context.read<Members>().addMembers(member); // 리스트에 객체 추가
                              Navigator.pop(context); // 바닥 시트 제거
                              FocusManager.instance.primaryFocus?.unfocus(); // 포커스 제거
                            }
                          }, child: const Text('Enter')),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 15,),
                        Text('The team is already full', style: TextStyle(fontSize: 20)),
                        SizedBox(height: 15,)
                      ],
                    );
                  }
                }
            );
          }, child: const Text('Add')),
        ],
      ),
    );
  }
}

class MemberPanel extends StatelessWidget {
  const MemberPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The number of out team member is:', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text(context.watch<Members>().memberList.length.toString(), style: const TextStyle(fontSize: 20),),
          ],
        ),
      ],
    );
  }
}
