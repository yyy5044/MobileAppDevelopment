import 'package:flutter/material.dart';
import 'style.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.orange,
        fontFamily: 'Pretendard',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final items = List.generate(100, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Malachite,
        title: const Text('Assignment 2'),// const를 붙이면 불필요한 리로딩이 발생하지 않아서 성능 향상에 도움
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.person)),
            ],
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 200.0,
            height: 200.0,
            margin: EdgeInsets.all(20.0),
            child:
            Opacity(
                opacity: 0.2,
                child: Image.asset('assets/warning.jpeg')
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){},
          ),
          ListTile(
            leading: const Icon(Icons.refresh),
            title: const Text('refresh'),
            trailing: const Icon(Icons.navigate_next),
            onTap: (){},
          ),
        ],
      ),
      drawer: const Drawer(),
    );
  }
}

