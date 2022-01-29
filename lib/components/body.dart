import 'package:flutter/material.dart';
import 'package:flutter_banking_app/components/BackGround.dart';
import 'package:flutter_banking_app/components/rounded_button.dart';
import 'package:flutter_banking_app/components/rounded_input_field.dart';
import 'package:flutter_banking_app/components/rounded_password_field.dart';
import 'package:flutter_banking_app/pages/home.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'already_have_an_account_acheck.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>const Home()));
              },
              color: Styles.accentColor,
            ),
            SizedBox(height: size.height * 0.03),

          ],
        ),
      ),
    );
  }
}
