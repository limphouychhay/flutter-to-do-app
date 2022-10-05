import 'package:flutter/material.dart';

import './utils/util.dart';
import './screens/screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            KeyboardHidden.hideKeyboard(context);
          },
          child: child,
        );
      },
      home: HomeScreen(),
    );
  }
}
