import 'package:flutter/material.dart';

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

class TodoTile extends StatefulWidget {
  TodoTile({
    Key? key, required this.todo, required this.onDismissed
  }) : super(key: key);

  stTodo todo;
  final DismissDirectionCallback onDismissed;

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todo.id),
      onDismissed: (direction) => widget.onDismissed(direction),
      child: Padding(
          padding:const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                    value: widget.todo.isCheck,
                    onChanged: (bool? state){
                      setState(() {
                        widget.todo.isCheck = state ?? false;
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
                      child: Text(widget.todo.taskName),
                      onPressed: () {
                        setState(() {
                          widget.todo.isCheck = !widget.todo.isCheck;
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
