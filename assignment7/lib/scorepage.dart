import 'package:assignment7/editpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scores'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScorePanel(),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage()));
          }, child: const Text('Edit')),
        ],
      ),
    );
  }
}

class ScorePanel extends StatelessWidget {
  const ScorePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Mid-Term', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text(context.watch<Scores>().midTermExam.toString(), style: const TextStyle(fontSize: 20),),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Final', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 20,),
            Text(context.watch<Scores>().finalExam.toString(), style: const TextStyle(fontSize: 20),),
          ],
        ),
      ],
    );
  }
}
