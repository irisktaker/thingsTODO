import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {},
          child: Image.asset(
            "assets/icons/search.png",
            scale: 3,
          ),
        ),
        fillColor: ThemeColors.whiteColor,
        filled: true,
        hintText: 'Search Task',
        hintStyle: const TextStyle(
          color: ThemeColors.lightGreyColor,
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
      style: const TextStyle(
        color: ThemeColors.blackColor,
      ),
    );
  }
}

// TextField CustomSearchWidget(BuildContext context) {
//     return 
//   }