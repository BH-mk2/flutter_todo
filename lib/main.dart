import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dialog/inputdialog_todo.dart';

class stTodo {
  String id = '';
  String taskName = '';
  bool isCheck=false;

  stTodo({required String id, required String taskName, required bool isCheck}){
    this.id = id;
    this.taskName = taskName;
    this.isCheck = isCheck;
  }
}

// TODOアプリ
// TODOの追加・削除・チェックの付け外しが出来る
// しかも、アプリを閉じても状態を保存出来る
void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<stTodo> todoList = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Todo App', todoList: todoList),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget  {
  MyHomePage({super.key, required this.title, required this.todoList});

  final String title;

  // Todoリストのデータ
  final List<stTodo> todoList;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {

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
              [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.todoList.length,
                  itemBuilder: (BuildContext context, index) {
                    return TodoTile(
                      id: widget.todoList[index].id,
                      taskName: widget.todoList[index].taskName,
                      isCheck: widget.todoList[index].isCheck,
                      onDismissed: (direction) {
                        setState(() {
                          widget.todoList.removeAt(index);
                          print('remove todo index:${index.toString()}');
                        });
                      },
                    );
                  }
                ),
              ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String? inputText = await showDialog<String>(
            context: context,
            builder: (_) {
              return InputDialogTodo();
            }
          );
          // print(inputText);

          if(inputText==null){
            print("Input Todo's Text is Null!");
            return;
          }else if(inputText.isEmpty){
            print("Input Todo's Text is Empty!");
            return;
          }

          var uuid = Uuid();
          stTodo task = stTodo(
              id: uuid.v4(),
              taskName:inputText.toString(),
              isCheck:false);
          widget.todoList.add(task);
          setState(() {

          });
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoTile extends StatefulWidget {
  TodoTile({
    Key? key,required this.id, required this.taskName, required this.isCheck,
    required this.onDismissed
  }) : super(key: key);

  String id;
  String taskName;
  bool isCheck;
  final DismissDirectionCallback onDismissed;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id),
      onDismissed: (direction) => widget.onDismissed(direction),
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
                value: widget.isCheck,
                onChanged: (bool? state){
                  setState(() {
                      widget.isCheck = state ?? false;
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
                  child: Text(widget.taskName),
                  onPressed: () {
                    setState(() {
                      widget.isCheck = !widget.isCheck;
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
