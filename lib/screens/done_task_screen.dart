import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  static const screenRoute = 'doneTaskScreen';

  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("DoneTaskScreen"),
      ),
    );
  }
}
