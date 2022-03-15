import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BuildTextFieldWidget extends StatelessWidget {
  String hintText;
  Widget prefixIcon;
  TextEditingController? controller;
  bool obscureText;

  BuildTextFieldWidget({
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: AppColors().greyColor,
      ),
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors().lightGreyColor,
        ),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
