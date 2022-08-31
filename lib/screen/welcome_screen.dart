import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_vocab/resources/firebase_auth_methods.dart';
import 'package:my_vocab/screen/responsive/mobile_screen_layout.dart';
import 'package:my_vocab/screen/responsive/responsive_layout.dart';
import 'package:my_vocab/screen/responsive/web_screen_layout.dart';

import '../utils/global_constant.dart';

import '../widgets/sign_in_form_widget.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();
  bool _isSigningIn = false;

  logInHandler() async {
    setState(() {
      _isSigningIn = true;
    });
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final String? result = await FirebaseAuthMethods()
        .signInWithEmailAndPassword(email: emailFieldController.text, password: passwordFieldController.text);
    if (result != null) {
      setState(() {
        _isSigningIn = false;
        emailFieldController.clear();
        passwordFieldController.clear();
      });
      if (result == "Success") {
        messenger.showSnackBar(resultSnackBarBuilder("Successfully loged in!"));
        
      } else {
        messenger.showSnackBar(resultSnackBarBuilder(result.toString()));
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailFieldController.dispose();
    passwordFieldController.dispose();
    super.dispose();
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: Container()),
                // Title
                const Text(
                  "My vocab",
                  style: titleTextStyle,
                ),
                spacer,
                // Email and password textField
                SignInFormWidget(emailFieldController: emailFieldController, passwordFieldController: passwordFieldController),
                spacer,
                // Login Button
                InkWell(
                  onTap: logInHandler,
                  child: Ink(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: defaultBorderRadius),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Center(
                        child: _isSigningIn
                            ? CircularProgressIndicator()
                            : Text(
                                "Log in",
                                style: buttonTextStyle,
                              )),
                  ),
                ),

                // Remember next time
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(onTap: () {}, child: Icon(Icons.check_box_outline_blank_rounded)),
                    Text("Remember me"),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Forgot password?"),
                            )))
                  ],
                ),

                // Or ui
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      margin: EdgeInsets.only(right: 10),
                      color: Colors.white,
                    )),
                    Text("Or"),
                    Expanded(
                        child: Container(
                      height: 1,
                      margin: EdgeInsets.only(left: 10),
                      color: Colors.white,
                    )),
                  ],
                ),
                spacer,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Log in with google
                      Container(
                        decoration: BoxDecoration(borderRadius: defaultBorderRadius, color: Colors.white),
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(googleLogoPath),
                                  ),
                                )),
                            Flexible(
                              flex: 7,
                              child: Text(
                                "Log in with google",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                      spacer,
                      // Log in with facebook
                      Container(
                        decoration: BoxDecoration(borderRadius: defaultBorderRadius, color: Color.fromRGBO(23, 119, 242, 1)),
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Flexible(
                                fit: FlexFit.tight,
                                flex: 3,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(facebookLogoPath),
                                  ),
                                )),
                            Flexible(
                              flex: 7,
                              child: Text(
                                "Log in with facebook",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () => Navigator.of(context).pushReplacementNamed(signUpScreenPathName), child: Text("Sign up"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
