// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:things_to_do/utils/colors.dart';

class TasksTextFieldWidget extends StatelessWidget {
  TasksTextFieldWidget({ Key? key, required this.text, required this.controller }) : super(key: key);

  String text;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              fillColor: ThemeColors.whiteColor,
              filled: true,
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                color: ThemeColors.lightGreyColor,
                fontSize: 14,
              )),
        ),
        Divider(
          height: 0,
          color: Colors.grey.shade300,
          thickness: 1,
        ),
      ],
    );
  }
}
