import 'package:flutter/material.dart';
import 'package:flutter_banking_app/components/text_field_container.dart';

import '../constants.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  TextEditingController pwdController = new TextEditingController() ;

   RoundedPasswordField({
    Key? key,
     required this.onChanged,
    required this.pwdController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller:pwdController,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,

        ),
      ),
    );
  }
}
