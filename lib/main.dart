import 'package:flutter/material.dart';

// TODOアプリ
// TODOの追加・削除・チェックの付け外しが出来る
// しかも、アプリを閉じても状態を保存出来る
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
            <Widget>[
              TodoTile(id:'0'),
              TodoTile(id:'1'),
              TodoTile(id:'2'),
              TodoTile(id:'3'),
              TodoTile(id:'4'),
              TodoTile(id:'5'),
              TodoTile(id:'6'),
              TodoTile(id:'7'),
              TodoTile(id:'8'),
              TodoTile(id:'9'),
            ],
        ),
      ),
    );
  }
}

class TodoTile extends StatefulWidget {
  TodoTile({
    Key? key,required this.id
  }) : super(key: key);

  String id;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id),
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
                value: isCheck,
                onChanged: (bool? state){
                  setState(() {
                      isCheck = state ?? false;
                  });
                }
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(10)
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          bottomLeft: Radius.circular(0),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )
                    )
                  ),
                  child: const Text('TodoTile'),
                  onPressed: () {
                    setState(() {
                      isCheck = !isCheck;
                    });
                  },
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}
