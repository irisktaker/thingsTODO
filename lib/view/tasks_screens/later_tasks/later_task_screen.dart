import 'package:flutter/material.dart';

class LaterTaskScreen extends StatelessWidget {
  static const screenRoute = 'laterTaskScreen';

  const LaterTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("LaterTaskScreen"),
      ),
    );
  }
}
