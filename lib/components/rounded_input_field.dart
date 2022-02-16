import 'package:flutter/material.dart';
import 'package:flutter_banking_app/components/text_field_container.dart';

import '../constants.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  TextEditingController phoneController = new TextEditingController() ;

  final ValueChanged<String> onChanged;
   RoundedInputField({
    Key? key,
   required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
     required this.phoneController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: phoneController,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
