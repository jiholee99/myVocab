import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_vocab/screen/responsive/mobile_screen_layout.dart';
import 'package:my_vocab/screen/responsive/responsive_layout.dart';
import 'package:my_vocab/screen/responsive/web_screen_layout.dart';
import 'package:my_vocab/utils/form_validation.dart';
import 'package:my_vocab/widgets/sign_up_form_widget.dart';

import '../resources/firebase_auth_methods.dart';

import '../utils/global_constant.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailFieldController = TextEditingController();

  final TextEditingController passwordFieldController = TextEditingController();

  final TextEditingController confirmPasswordFieldController = TextEditingController();

  logInHandler() async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final String? result = await FirebaseAuthMethods().signUpWithEmailAndPassword(
        email: emailFieldController.text,
        password: passwordFieldController.text,
        confirmPassword: confirmPasswordFieldController.text);
    messenger.clearSnackBars();
    if (result == "Success") {
      messenger.showSnackBar(resultSnackBarBuilder("Successfully signed up!"));
      navigator.pushReplacement(MaterialPageRoute(
        builder: (context) {
          return ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout());
        },
      ));
    } else {
      
      messenger.showSnackBar(resultSnackBarBuilder(result.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        height: mediaQuery.size.height - (mediaQuery.viewPadding.vertical),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Flexible(child: Container()),
            // Title logo
            const Text(
              "My vocab",
              style: titleTextStyle,
            ),
            spacer,
            // Textfields for email, passwords
            SignUpFormWidget(
                emailFieldController: emailFieldController,
                passwordFieldController: passwordFieldController,
                confirmPasswordFieldController: confirmPasswordFieldController),
            spacer,
            // Sign up button
            InkWell(
              onTap: logInHandler,
              child: Ink(
                height: 50,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: defaultBorderRadius),
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                child: const Center(
                    child: Text(
                  "Sign up",
                  style: buttonTextStyle,
                )),
              ),
            ),
            Flexible(
              child: Container(),
            ),
            // Text button to jump to log in screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already has an account?"),
                TextButton(
                    onPressed: () => Navigator.of(context).pushReplacementNamed(welcomeScreenPathName), child: Text("Log in"))
              ],
            ),
          ],
        ),
      )),
    ));
  }
}
