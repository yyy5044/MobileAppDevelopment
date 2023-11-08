import 'package:flutter/material.dart';

enum StudentType { leader, member }

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receive User Information',
      theme: ThemeData(
        primarySwatch: Colors.orange ,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _midMyController = TextEditingController();
  final _finalMyController = TextEditingController();
  var _midScore = 0;
  var _finalScore = 0;
  String _grade = 'B';

  StudentType _isLeader = StudentType.member;

  final _additionalPointItems = List.generate(10, (i) => i);
  int _additionalPoint = 0;

  bool _isAbsense = false;

  void dispose(){
    _midMyController.dispose();
    _finalMyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment 4'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mid-term exam'

                ),
                controller: _midMyController,
                keyboardType: TextInputType.number,
              ),
              Container(height: 20),
              TextField(
                decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fianl exam'

                ),
                controller: _finalMyController,
                keyboardType: TextInputType.number,
              ),
              Container(height: 20),
              RadioListTile(
                title: Text('Team Project Leader(+10)'),
                value: StudentType.leader,
                groupValue: _isLeader,
                onChanged: (value){
                  setState(() {
                    _isLeader = value!;
                  });
                }
              ),
              RadioListTile(
                title: Text('Team Project Member'),
                value: StudentType.member,
                groupValue: _isLeader,
                onChanged: (value){
                  setState(() {
                    _isLeader = value!;
                  });
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Additional Point'),
                  DropdownButton(
                    value: _additionalPoint,
                    items: _additionalPointItems.map(
                            (point) => DropdownMenuItem(
                            value: point,
                            child: Text('$point point'))).toList(),
                    onChanged: (value){
                      setState(() {
                        _additionalPoint = value!;
                      });
                    }
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Absence less than 4'),
                Checkbox(
                  value: _isAbsense,
                  onChanged: (value){
                    setState(() {
                      _isAbsense = value!;
                    });}
                )
              ],),
              Text(
                _grade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.red,
                )
              ),
              Container(height: 20),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    var _midScore = double.parse(_midMyController.text.trim());
                    var _finalScore = double.parse(_finalMyController.text.trim());

                    var _totalScore = _midScore + _finalScore + _additionalPoint;

                    if(_isLeader == StudentType.leader){
                      _totalScore += 10;
                    }

                    if(_isAbsense){
                      setState(() {
                        _grade = 'F';
                      });
                    }else{
                      if(_totalScore >= 170){
                        setState(() {
                          _grade = 'A';
                        });
                      }else if(_totalScore < 170 && _totalScore >= 150){
                        setState(() {
                          _grade = 'B';
                        });
                      }else if(_totalScore < 150 && _totalScore >= 130){
                        setState(() {
                          _grade = 'C';
                        });
                      }else if(_totalScore < 130 && _totalScore >= 110){
                        setState(() {
                          _grade = 'D';
                        });
                      }else{
                        setState(() {
                          _grade = 'F';
                        });
                      }
                    }
                  });
                },
                child: Text('Enter')
              ),
            ],
          )
        ),
      ),
    );
  }
}