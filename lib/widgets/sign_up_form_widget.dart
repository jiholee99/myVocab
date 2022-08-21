import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/global_constant.dart';
import '../utils/form_validation.dart';

class SignUpFormWidget extends StatefulWidget {
  final TextEditingController emailFieldController;
  final TextEditingController passwordFieldController;
  final TextEditingController confirmPasswordFieldController;
  SignUpFormWidget(
      {required this.emailFieldController, required this.passwordFieldController, required this.confirmPasswordFieldController});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Widget textFieldContainerBuilder({required IconData icon, required Widget child, bool isPassword = false, Widget? passwordWidget}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.4), borderRadius: defaultBorderRadius),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(child: child),
          if (isPassword)
            const SizedBox(
              width: 10,
            ),
          if (isPassword)
            if (passwordWidget != null)
              passwordWidget
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email textfield
        textFieldContainerBuilder(
          icon: Icons.email_rounded,
          child: TextField(
            controller: widget.emailFieldController,
            style: textFieldTextStyle,
            decoration:
                const InputDecoration(hintText: "Enter email address", border: UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        spacer,

        // Password textfield
        textFieldContainerBuilder(
            icon: Icons.key_rounded,
            child: TextField(
              controller: widget.passwordFieldController,
              obscureText: _isPasswordVisible ? false : true,
              style: textFieldTextStyle,
              decoration:
                  const InputDecoration(hintText: "Enter password", border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
            isPassword: true,
            passwordWidget: InkWell(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: _isPasswordVisible ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.remove_red_eye_rounded))),
        spacer,

        // Confirm password textfield
        textFieldContainerBuilder(
            icon: Icons.key_rounded,
            child: TextField(
              controller: widget.confirmPasswordFieldController,
              style: textFieldTextStyle,
              obscureText: _isConfirmPasswordVisible ? false : true,
              decoration:
                  const InputDecoration(hintText: "Confirm password", border: UnderlineInputBorder(borderSide: BorderSide.none)),
            ),
            isPassword: true,
            passwordWidget: InkWell(
                onTap: () {
                  setState(() {
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                  });
                },
                child: _isConfirmPasswordVisible ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.remove_red_eye_rounded))),
        spacer,
      ],
    );
  }
}
