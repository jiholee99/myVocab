import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/global_constant.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = homeScreenPathName;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home page")),      
    );
  }
}