import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Soccer Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _left = 0;
  int _right = 0;
  int _win = 0;
  int _draw = 0;
  int _lose = 0;

  void _incrementLeft() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _left++;
    });
  }

  void _incrementRight() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _right++;
    });
  }

  void _refreshScore() {
    setState(() {
      _left = 0;
      _right = 0;
      _win = 0;
      _draw = 0;
      _lose = 0;
    });
  }

  void _resetGame(){
    setState(() {
      _left = 0;
      _right = 0;
    });
  }

  void _gameOver(){
    setState(() {
      if(_left > _right){
        _win++;
      }else if(_left == _right){
        _draw++;
      }
      else{
        _lose++;
      }

      _left = 0;
      _right = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25)
              ),
              child: const Image(
                  image: AssetImage(
                      'assets/soccer-1.png'
                  ),
                  width: 150.0
              )
            ),
            ElevatedButton(onPressed: _resetGame, child: const Text('Reset Game')),

            const Text(
              'Your Team        Rival Team',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$_left',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text(
                  ':'
                ),
                Text(
                  '$_right',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _incrementLeft, child: const Text('Goal')),
                ElevatedButton(onPressed: _incrementRight, child: const Text('Goal'))
              ],
            ),

            ElevatedButton(onPressed: _gameOver, child: const Text('Game Over')),

            const Text(
                'Set Score'
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Win :'),
                Text(
                  '$_win',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text('Draw :'),
                Text(
                  '$_draw',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Text('Lose :'),
                Text(
                  '$_lose',
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshScore,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
