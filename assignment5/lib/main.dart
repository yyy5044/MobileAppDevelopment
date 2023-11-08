import 'package:flutter/material.dart';

List<String> listPoint = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(),
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Grade Calculator'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: (){},
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Information'),
              Tab(text: 'List'),
            ]
          ),
        ),
        body: const TabBarView(
          children: [
            Tab(
              child: MyForm()
            ),
            Tab(
              child: MyListPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String currName = '';
  int currProjectPoint = 0;
  int currAdditionalPoint = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text.';
                } else if (double.tryParse(value) != null) {
                  return 'Please enter some string, not a number.';
                }
                return null;
              },
              onSaved: (value) => currName = value!,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Project point',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text.';
                } else if (int.tryParse(value) == null) {
                  return 'Please enter some integer.';
                }
                return null;
              },
              onSaved: (value) => currProjectPoint = int.parse(value!),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Additional Point',
              ),
              value: currAdditionalPoint,
              items: List.generate(11, (i) {
                if (i == 0) {
                  return DropdownMenuItem(
                      value: i-1,
                      child: const Text('Choose the additional point')
                  );
                }
                return DropdownMenuItem(
                    value: i-1,
                    child: Text('${i-1} point')
                );

              }),
              onChanged: (value) {
                setState(() {
                  currAdditionalPoint = (value!);
                });
              },
              validator: (value) {
                if (value == -1) {
                  return 'Please select the point';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              child: Container(
                height: 60, color: Colors.indigo,
                child: const Center(
                  child: Text('Enter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                  ),
                ),
              )),
              onTap: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Processing data'),
                    ));
                    _formKey.currentState!.save();
                    listPoint.add('$currName: ${currProjectPoint + currAdditionalPoint}');
                  }
                });
              },
            ),
          ],

        ),
      ),
    );
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: listPoint.length,
      itemBuilder: (c, i){
        return Dismissible(
          key: ValueKey(listPoint[i]),
          background: Container(
            color: Colors.green,
          ),
          child: ListTile(
            leading: const Icon(Icons.home),
            title: Text(listPoint[i]),
          ),
          onDismissed: (direction) {
            setState(() {
              listPoint.removeAt(i);
            });
          },
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          listPoint.insert(newIndex, listPoint.removeAt(oldIndex));
        });
      },
    );
  }
}

