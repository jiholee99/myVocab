import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/global_constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                Flexible(
                    child: Container(
                        //\color: Colors.white,
                        )),
                // Title
                const Text(
                  "My vocab",
                  style: titleTextStyle,
                ),
                spacer,
                Form(
                    child: Column(
                  children: [
                    // Email textfield
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4), borderRadius: defaultBorderRadius),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: TextFormField(
                              style: textFieldTextStyle,
                              decoration: const InputDecoration(
                                  hintText: "Enter email address", border: UnderlineInputBorder(borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacer,
                    // Password textfield
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4), borderRadius: defaultBorderRadius),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.key,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: TextFormField(
                              style: textFieldTextStyle,
                              decoration: const InputDecoration(
                                  hintText: "Enter password", border: UnderlineInputBorder(borderSide: BorderSide.none)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),

                spacer,
                // Login Button
                InkWell(
                  child: Ink(
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey, borderRadius: defaultBorderRadius),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Center(
                        child: Text(
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
