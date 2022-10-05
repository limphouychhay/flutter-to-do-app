import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../screen.dart';
import './widgets/widget.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<String> toDoList = [];
  final List<String> deleteList = [];

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputTextController =
        useTextEditingController();
    final renewState = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextInput(
                inputTextController: inputTextController,
                hintText: 'Input To Do Here',
              ),
              RowButton(
                title1: 'ADD',
                title2: 'CLEAR',
                onPressed1: () {
                  if (inputTextController.text.isNotEmpty) {
                    toDoList.add(inputTextController.text);
                  }
                  inputTextController.clear();
                  renewState.value = !renewState.value;
                },
                onPressed2: () {
                  toDoList.clear();
                  deleteList.clear();
                  renewState.value = !renewState.value;
                },
              ),
              toDoList.isNotEmpty
                  ? Column(
                      children: [
                        const Header(title: 'To Do List'),
                        ItemList(
                          itemCount: toDoList.length,
                          itemBuilder: (BuildContext context, index) {
                            return Item(
                              index: index,
                              text: toDoList[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      toDo: toDoList[index],
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                deleteList.add(toDoList[index]);
                                toDoList.removeAt(index);
                                renewState.value = !renewState.value;
                              },
                            );
                          },
                        ),
                        const Separator(thickness: 1),
                      ],
                    )
                  : const SizedBox(),
              deleteList.isNotEmpty
                  ? Column(
                      children: [
                        const Header(title: 'Delete List'),
                        ItemList(
                          itemCount: deleteList.length,
                          itemBuilder: (BuildContext context, index) {
                            return Item(
                              index: index,
                              text: deleteList[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      toDo: deleteList[index],
                                    ),
                                  ),
                                );
                              },
                              onLongPress: () {
                                deleteList.removeAt(index);
                                renewState.value = !renewState.value;
                              },
                            );
                          },
                        ),
                        const Separator(thickness: 1),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
