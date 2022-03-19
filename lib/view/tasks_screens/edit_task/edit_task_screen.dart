import 'package:flutter/material.dart';

class EditTakScreen extends StatelessWidget {
  static const screenRoute = 'editTaskScreen';
  const EditTakScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Edit Screen"),
      ),
    );
  }
}
