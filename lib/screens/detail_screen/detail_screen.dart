import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailScreen extends HookWidget {
  const DetailScreen({Key? key, required this.toDo}) : super(key: key);

  final String toDo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: Text(toDo),
      ),
    );
  }
}
