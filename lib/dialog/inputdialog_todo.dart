import 'package:flutter/material.dart';

class InputDialogTodo extends StatefulWidget {
  const InputDialogTodo({Key? key, this.text}) : super(key: key);
  final String? text;

  @override
  State<StatefulWidget> createState() => _InputDialogTodoState();

}

class _InputDialogTodoState extends State<InputDialogTodo> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.text = widget.text ?? '';
    focusNode.addListener(
        () {
          if(focusNode.hasFocus) {
            controller.selection = TextSelection(baseOffset: 0, extentOffset: controller.text.length);
          }
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextFormField(
        autofocus: true,
        focusNode: focusNode,
        controller: controller,
        onFieldSubmitted: (_) {
          Navigator.of(context).pop(controller.text);
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: const Text('Add'),
        )
      ],
    );
  }

}
