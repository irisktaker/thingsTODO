import 'package:flutter/material.dart';

import '/utils/colors.dart';
import 'login_screen_bloc.dart';
import '../home_screen/home_screen.dart';
import '/widgets/shared_widgets/custom_circle_avatar/custom_circle.dart';
import '/widgets/shared_widgets/text_fields/custom_general_text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenBloc _bloc = LoginScreenBloc();

  @override
  void initState() {
    _bloc.getUserLoginInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ThemeColors.whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          width: size.width,
          height: size.height,
          child: Form(
            key: _bloc.formKey,
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
                      color: ThemeColors.lightGreyColor,
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomGeneralTextFieldWidget(
                        controller: _bloc.userNameController,
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      buildCustomDivider(),
                      CustomGeneralTextFieldWidget(
                        controller: _bloc.passwordController,
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_bloc.formKey.currentState!.validate()) {
                      await _bloc.rememberUserLogin(context);
                      await _bloc.authorize(context, setState, mounted);
                    }
                    Navigator.pushReplacementNamed(
                        context, HomeScreen.screenRoute);
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
                      size: size.width / 2 - 70,
                    ),
                    const Text(
                      "OR",
                      style: TextStyle(
                        fontSize: 18,
                        color: ThemeColors.lightGreyColor,
                      ),
                    ),
                    buildCustomDivider(
                      size: size.width / 2 - 70,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "login using social media",
                    style: TextStyle(
                      fontSize: 16,
                      color: ThemeColors.greyColor.withOpacity(0.4),
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BuildCustomCircle(
                      color: const Color(0xFF3d5097),
                      radius: 24,
                      child: Image.asset(
                        "assets/icons/facebook.png",
                        width: 20,
                        height: 20,
                        color: ThemeColors.whiteColor,
                      ),
                    ),
                    BuildCustomCircle(
                      color: const Color(0xFF0098f3),
                      radius: 24,
                      child: Image.asset(
                        "assets/icons/twitter.png",
                        width: 20,
                        height: 20,
                        color: ThemeColors.whiteColor,
                      ),
                    ),
                    BuildCustomCircle(
                      color: const Color(0xFFf7243a),
                      radius: 24,
                      child: Image.asset(
                        "assets/icons/google-plus-logo.png",
                        width: 20,
                        height: 20,
                        color: ThemeColors.whiteColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(
          thickness: 1.1,
          color: ThemeColors.lightGreyColor,
        ),
      ),
    );
  }
}
