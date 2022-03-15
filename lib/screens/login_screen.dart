import 'package:flutter/material.dart';
import 'package:things_to_do/screens/things_to_do_screen.dart';
import 'package:things_to_do/utils/colors.dart';

import '../widgets/custom_circle.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors().whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              const Spacer(flex: 4),
              Image.asset(
                "assets/logo/main_logo.png",
                width: 150,
                height: 150,
              ),
              const Spacer(flex: 1),
              Container(
                height: 134,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors().lightGreyColor,
                  ),
                ),
                child: Column(
                  children: [
                    BuildTextFieldWidget(
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                    buildCustomDivider(),
                    BuildTextFieldWidget(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, ThingsToDoScreen.screenRoute);
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCustomDivider(
                    size: size.width / 2 - 66,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors().lightGreyColor,
                    ),
                  ),
                  buildCustomDivider(
                    size: size.width / 2 - 66,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "login using social media",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors().greyColor.withOpacity(0.4),
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCustomCircle(
                    color: const Color(0xFF3d5097),
                    radius: 24,
                    child: Image.asset(
                      "assets/icons/facebook.png",
                      width: 20,
                      height: 20,
                      color: AppColors().whiteColor,
                    ),
                  ),
                  buildCustomCircle(
                    color: const Color(0xFF0098f3),
                    radius: 24,
                    child: Image.asset(
                      "assets/icons/twitter.png",
                      width: 20,
                      height: 20,
                      color: AppColors().whiteColor,
                    ),
                  ),
                  buildCustomCircle(
                    color: const Color(0xFFf7243a),
                    radius: 24,
                    child: Image.asset(
                      "assets/icons/google-plus-logo.png",
                      width: 20,
                      height: 20,
                      color: AppColors().whiteColor,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildCustomDivider({
    double? size,
  }) {
    return SizedBox(
      width: size,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Divider(
          color: AppColors().lightGreyColor,
        ),
      ),
    );
  }
}
