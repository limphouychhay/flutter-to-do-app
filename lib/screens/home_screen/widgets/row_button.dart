import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  const RowButton({
    Key? key,
    required this.onPressed1,
    required this.onPressed2,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final void Function() onPressed1;
  final void Function() onPressed2;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: onPressed1,
          // onPressed: () {
          //   if (inputTextController.text.isNotEmpty) {
          //     toDoList.add(inputTextController.text);
          //   }
          //   inputTextController.clear();
          //   renewState.value = !renewState.value;
          // },
          // child: const Text('ADD'),
          child: Text(title1),
        ),
        TextButton(
          onPressed: onPressed2,
          // onPressed: () {
          //   toDoList.clear();
          //   deleteList.clear();
          //   renewState.value = !renewState.value;
          // },
          // child: const Text('CLEAR'),
          child: Text(title2),
        ),
      ],
    );
  }
}
