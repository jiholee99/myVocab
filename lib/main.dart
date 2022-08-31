import 'package:flutter/material.dart';
// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_vocab/resources/firebase_auth_methods.dart';
import 'firebase_options.dart';

// From the folders
import '../utils/global_constant.dart';
//Screens
import '../screen/welcome_screen.dart';
import '../screen/sign_up_screen.dart';
import '../screen/responsive/responsive_layout.dart';
import '../screen/responsive/mobile_screen_layout.dart';
import '../screen/responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (_, snapshot) {
            
            print("Build");
            if (snapshot.connectionState == ConnectionState.active) {
              print(snapshot.data.toString()+" 2");
              if (snapshot.data != null) {
                return ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.data == null) {
                return WelcomeScreen();
              }

              // If it's waiting for the auth state to come back
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            // if the user hasn't been authenticated
            print("User not authenticated");
            return WelcomeScreen();
            
          }),
      routes: {
        welcomeScreenPathName: (_) => WelcomeScreen(),
        signUpScreenPathName: (_) => SignUpScreen(),
      },
    );
  }
}
