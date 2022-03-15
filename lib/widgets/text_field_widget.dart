import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BuildTextFieldWidget extends StatelessWidget {
  String hintText;
  Widget prefixIcon;

  BuildTextFieldWidget({
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
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
