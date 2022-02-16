import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/Model/Account.dart';
import 'package:flutter_banking_app/Model/Client.dart';
import 'package:flutter_banking_app/Model/SharedPref.dart';
import 'package:flutter_banking_app/components/BackGround.dart';
import 'package:flutter_banking_app/components/body.dart';
import 'package:flutter_banking_app/components/rounded_button.dart';
import 'package:flutter_banking_app/components/rounded_input_field.dart';
import 'package:flutter_banking_app/components/rounded_password_field.dart';
import 'package:flutter_banking_app/pages/home.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'circular.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController phoneController = new TextEditingController() ;
TextEditingController pwdController = new TextEditingController() ;
class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isLoading = false;
  SharedPref sharedPref = new SharedPref();
  final _formKey = GlobalKey<FormState>();

  bool _isValide=false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getClientInfo(Client client) async{
      String url = "https://ensaspay-zuul-gateway.herokuapp.com/api/client/getClient/${client.ttel}";
      var jsonResponse;

      var response = await http.get( Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer ${client.ttoken}" ,
      }).then((value) async {
        jsonResponse=json.decode(value.body);
        if(jsonResponse!=null){

        }
        client.iid=jsonResponse["id"];
        client.ffirstName=jsonResponse["firstName"];
        client.llastName=jsonResponse["lastName"];
        client.aaddress=jsonResponse["address"];

        Account account =  Account();
        account.id=jsonResponse["account"]["id"];
        account.accountNumber=jsonResponse["account"]["accountNumber"];
        account.solde=jsonResponse["account"]["amount"];
        account.credit=jsonResponse["account"]["credit"];

        client.aaccount=account;
        try{
          sharedPref.save("client", client);
          Client clientInShared = Client.fromJson(await sharedPref.read("client"));
          print(clientInShared );
          print("hi hi");

        } catch (Exception){
          print("error in save");
          print(Exception.toString());
        }
        //print(json.encode(client));
        //print(client);
      }).catchError((error){
        print(error);
        print("login");
      });
//    if(response.statusCode==200){
//      jsonResponse=json.decode(response.body);
//      client.firstName;
//      print(jsonResponse);
//    }else{
//     getClientInfo(client);
//    }

    }

    signIn(String username,String password) async  {
      print("in sign in");
      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (Route<dynamic> route) => false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  const circular(key: null,)));
       SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String url = "https://ensaspay-zuul-gateway.herokuapp.com/oauth/token?grant_type=password&username=$username&password=$password";
    var jsonResponse;

    var response = await http.post(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Basic Y2xpZW50OnNlY3JldA==' ,
    });
    print("in sign in");

    if(response.statusCode==200){

      jsonResponse = json.decode(response.body);



      if(jsonResponse !=null){
        setState(()   async {
          _isLoading = false;
          Client client =Client();
          client.ttoken=jsonResponse["access_token"];
          client.ttel=username;
          print(jsonResponse);
          await getClientInfo(client);

          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => Home()), (Route<dynamic> route) => false);

        });
        print("---resp---");
        print(jsonResponse);
      }

    } else{
      print("statut code 400");
      setState(() {
        _isLoading=false;
        _isValide=true;
      });
      print(response.body);
    }

    }
    String? phoneNumberValidator(String value) {
      String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
      RegExp regExp = new RegExp(pattern);
      if (value.isEmpty) {
        return 'Veuillez renseigner votre numero de telephone';
      } else if (!regExp.hasMatch(value)) {
        return 'Veuillez entrer un numero valide';
      }
      return null;
    }

    String? passWordValidator(String value) {
      if (value.isEmpty) {
        return 'Veuillez renseigner votre mot de passe';
      }
      return null;
    }


    badPassword() {
      return
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text("numero de telephone ou mot de passe incorrect",style: TextStyle(
            color: Colors.red,
            fontSize: 14,
            fontFamily: "ubuntu",
            fontWeight: FontWeight.w400,
          ),),

        ) ;
    }


    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _isValide ? (  badPassword()) : Container(),
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Form(key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    phoneController: phoneController,
                    hintText: "Your username",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    pwdController: pwdController,
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "LOGIN",
                    press: () {
                      signIn(phoneController.text,pwdController.text);
                    },
                    color: Styles.accentColor,
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            )


          ],
        ),
      ),
    );

  }

}

class _LoginScreenState extends State<LoginScreen> {
  @override


  Widget build(BuildContext context) {

    return Scaffold(
      body: Body(),
    );
  }


}


