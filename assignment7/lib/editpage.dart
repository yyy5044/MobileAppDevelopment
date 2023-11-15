import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailedScores(),
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Edit Scores'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditPanel(),
            Text('Additional Midterm', style: TextStyle(fontSize: 16),),
            Text(context.watch<DetailedScores>().additionalMidterm.toString()),
            Text('Additional Final', style: TextStyle(fontSize: 16),),
            Text(context.watch<DetailedScores>().additionalFinal.toString()),
          ],
        ),
      ),
    );
  }
}

class EditPanel extends StatelessWidget {
  const EditPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100, child: const Text('Mid-Term', style: TextStyle(fontSize: 16))),
            TextButton(onPressed: (){
              context.read<Scores>().decreaseMidTerm();
            }, child: const Text('-', style: TextStyle(fontSize: 16),)),
            Text(context.select((Scores s) => s.midTermExam).toString(), style: const TextStyle(fontSize: 16),),
            TextButton(onPressed: (){
              context.read<Scores>().increaseMidTerm();
            }, child:const Text('+', style: TextStyle(fontSize: 16),)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100, child: const Text('Final', style: TextStyle(fontSize: 16))),
            TextButton(onPressed: (){
              context.read<Scores>().decreaseFinal();
            }, child: const Text('-', style: TextStyle(fontSize: 16),)),
            Text(context.select((Scores s) => s.finalExam).toString(), style: const TextStyle(fontSize: 16),),
            TextButton(onPressed: (){
              context.read<Scores>().increaseFinal();
            }, child: const Text('+', style: TextStyle(fontSize: 16),)),
          ],
        ),
      ],
    );
  }
}

