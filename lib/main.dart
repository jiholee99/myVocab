import 'package:flutter/material.dart';
// Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

// From the folders
import '../utils/global_constant.dart';
//Screens
import '../screen/welcome_screen.dart';
import '../screen/sign_up_screen.dart';
import '../screen/home_screen.dart';
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
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              }
            }
            return const WelcomeScreen();
          }),
      routes: {
        welcomeScreenPathName: (_) => const WelcomeScreen(),
        signUpScreenPathName: (_) => SignUpScreen(),
        homeScreenPathName: (_) => HomeScreen()
      },
    );
  }
}
