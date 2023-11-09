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
      title: 'Assignment6',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const MyHomePage(),
        '/measure' : (context) => const MeasurePage(),
        '/milk' : (context) => const MilkPage(),
        '/result' : (context) => const ResultPage(),
        '/sweetcoffee' : (context) => const SweetcoffeePage(),
        '/juiceorlatte' : (context) => const JuiceorlattePage(),
        '/coffeeagain' : (context) => const CoffeeAgainPage(),
      }
      // home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Beverage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text('I want to help you choose the beverage', style: TextStyle(fontSize: 30),),
          const SizedBox(
            height: 10,
          ),
          const Text('Let''s start!', style: TextStyle(fontSize: 50),),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            child: const Text('Go'),
            onPressed: (){
              setState(() {
                Navigator.pushNamed(context, '/measure');
              });
            },
          )

        ],
      )
    );

  }
}

class MeasurePage extends StatefulWidget {
  const MeasurePage({super.key});

  @override
  _MeasurePageState createState() => _MeasurePageState();
}

class _MeasurePageState extends State<MeasurePage> {
  var count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Your Coffee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('How many cups of coffee did you drink?', style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('$count cups', style: const TextStyle( 
                fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  if (count > 1){
                    setState(() {
                      count--;
                    });
                  }
                }, child: const Text('-')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    count++;
                  });
                }, child: const Text('+')),
              ],
            ),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                if (count <= 1) {
                  Navigator.pushNamed(context, '/milk');
                } else {
                  Navigator.pushNamed(context, '/juiceorlatte', arguments: count);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MilkPage extends StatefulWidget {
  const MilkPage({super.key});

  @override
  _MilkPageState createState() => _MilkPageState();
}

class _MilkPageState extends State<MilkPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Milk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Since you drank 1 cup of coffee you may want coffee', style: TextStyle(
              fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Do you want milk in the coffee?', style: TextStyle(
              fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/sweetcoffee');
                  });
                }, child: const Text('Yes')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/result', arguments: 'Americano');
                  });
                }, child: const Text('No')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class JuiceorlattePage extends StatefulWidget {
  const JuiceorlattePage({super.key});

  @override
  _JuiceorlattePageState createState() => _JuiceorlattePageState();
}

class _JuiceorlattePageState extends State<JuiceorlattePage> {

  @override
  Widget build(BuildContext context) {
    final count = ModalRoute.of(context)?.settings.arguments as int ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juice or Latte'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text('Since you drank $count cup of coffee you may want coffee', style: const TextStyle(
              fontSize: 30,
            ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Do you want juice or latte?', style: TextStyle(
              fontSize: 50,
            ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/result', arguments: 'Grapefruit Juice');
                  });
                }, child: const Text('Juice')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/coffeeagain');
                  });
                }, child: const Text('Latte')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class CoffeeAgainPage extends StatefulWidget {
  const CoffeeAgainPage({super.key});

  @override
  _CoffeeAgainPageState createState() => _CoffeeAgainPageState();
}

class _CoffeeAgainPageState extends State<CoffeeAgainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Again'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Do you want some more coffee?', style: TextStyle(
              fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/sweetcoffee');
                  });
                }, child: const Text('Yes')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/result', arguments: 'Sweet Potato Latte');
                  });
                }, child: const Text('No')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class SweetcoffeePage extends StatefulWidget {
  const SweetcoffeePage({super.key});

  @override
  _SweetcoffeePageState createState() => _SweetcoffeePageState();
}

class _SweetcoffeePageState extends State<SweetcoffeePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sweet Coffee'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text('Do you want sweet coffee?', style: TextStyle(
              fontSize: 50,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/result', arguments: 'Caffe Latte');
                  });
                }, child: const Text('Yes')),
                ElevatedButton(onPressed: (){
                  setState(() {
                    Navigator.pushNamed(context, '/result', arguments: 'Mocha Latte');
                  });
                }, child: const Text('No')),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String beverage = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: (){},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Your best beverage is', style: TextStyle(
              fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(beverage, style: const TextStyle(
              fontSize: 50,
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          // Navigator.popUntil() is used to pop until we reach the '/' route, which is our root route.
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
      ),

    );
  }
}


