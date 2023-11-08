import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 3',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final items = List.generate(16, (index) => index + 1).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Assignment 3'),// const를 붙이면 불필요한 리로딩이 발생하지 않아서 성능 향상에 도움
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.image)),
                Tab(icon: Icon(Icons.how_to_vote)),
                Tab(icon: Icon(Icons.upload)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: items.map((i) => Image.asset('assets/images/dog_$i.jpeg')).toList(),
                ),
              ),
              Tab(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Candidate'),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                            ),
                            elevation: 4.0,
                            child: Container(
                              child: Center(child: Text('Dog1', style: TextStyle(color: Colors.red))),
                              width: 100,
                              height: 100,
                            )
                          )
                        ),
                        Expanded(
                            flex: 3,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                elevation: 4.0,
                                child: Container(
                                  child: Center(child: Text('Dog2', style: TextStyle(color: Colors.green))),
                                  width: 100,
                                  height: 100,
                                )
                            )
                        ),
                        Expanded(
                            flex: 3,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)
                                ),
                                elevation: 4.0,
                                child: Container(
                                  child: Center(child: Text('Dog3', style: TextStyle(color: Colors.blue))),
                                  width: 100,
                                  height: 100,
                                )
                            )
                        ),
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text('Vote Rate'))
                        ]
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Center(child: Text('50%')),
                            color: Colors.red,
                            width: 100,
                            height: 100,
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Center(child: Text('20%')),
                            color: Colors.green,
                            width: 100,
                            height: 100,
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Center(child: Text('30%')),
                            color: Colors.blue,
                            width: 100,
                            height: 100,
                          )
                        ),
                      ],
                    )
                  ],
                )
              ),
              Tab(
                child: LinearProgressIndicator(),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.photo_album), label: 'album'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
            ],
          ),
        ),
    );
  }
}