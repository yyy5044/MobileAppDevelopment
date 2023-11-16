import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members.dart';

class MemberListPage extends StatelessWidget {
  const MemberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Member List'),
      ),
      body: ListView.builder(
        itemCount: context.watch<Members>().memberList.length,
          itemBuilder: (swipe, index){
            return Dismissible(
              key: UniqueKey(),
              child: ListTile(
                title: Text('${context.watch<Members>().memberList[index].studentName} (${context.watch<Members>().memberList[index].studentNum})')
              ),
              onDismissed: (swipe) => {
                context.read<Members>().removeMembers(index)
              },
            );
          }
      )
    );
  }
}


