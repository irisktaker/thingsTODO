import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

import '/screens/home_screen.dart';
import '/utils/colors.dart';
import '../widgets/custom_circle.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final LocalAuthentication localAuth = LocalAuthentication();

  Future<void> _authorize() async {
    bool _isAuthorized = false;
    try {
      _isAuthorized = await localAuth.authenticate(
        biometricOnly: true,
        localizedReason: 'Please authenticate to Complete this process',
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;
    setState(() {
      if (_isAuthorized) {
        Navigator.pushReplacementNamed(context, HomeScreen.screenRoute);
      } else {
        null;
      }
    });
  }

  Future<void> rememberUserLogin(BuildContext context) async {
    await storage.write(key: 'U', value: _userNameController.text);
    await storage.write(key: 'P', value: _passwordController.text);
  }

  Future<void> getUserLoginInfo() async {
    _userNameController.text = await storage.read(key: 'U') ?? "";
    _passwordController.text = await storage.read(key: 'P') ?? "";
  }

  @override
  void initState() {
    getUserLoginInfo();
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
        backgroundColor: AppColors().whiteColor,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 54),
          width: size.width,
          height: size.height,
          child: Form(
            key: formKey,
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
                        controller: _userNameController,
                        hintText: "Username",
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      buildCustomDivider(),
                      BuildTextFieldWidget(
                        controller: _passwordController,
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
                    if (formKey.currentState!.validate()) {
                      await rememberUserLogin(context);
                      await _authorize();
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
          thickness: 1.1,
          color: AppColors().lightGreyColor,
        ),
      ),
    );
  }
}
