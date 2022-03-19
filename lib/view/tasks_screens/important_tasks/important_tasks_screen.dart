import 'package:flutter/material.dart';

class ImportantTaskScreen extends StatelessWidget {
  static const screenRoute = 'importantTaskScreen';

  const ImportantTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("ImportantTaskScreen"),
      ),
    );
  }
}
