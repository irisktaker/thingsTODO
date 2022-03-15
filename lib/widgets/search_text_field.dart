import 'package:flutter/material.dart';

import '../utils/colors.dart';

TextField buildSearchTextField(BuildContext context) {
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
        fillColor: AppColors().whiteColor,
        filled: true,
        hintText: 'Search Task',
        hintStyle: TextStyle(
          color: AppColors().lightGreyColor,
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
      style: TextStyle(
        color: AppColors().blackColor,
      ),
    );
  }