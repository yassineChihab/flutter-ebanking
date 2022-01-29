import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/send_money.dart';
import 'package:flutter_banking_app/pages/stats.dart';
import 'package:flutter_banking_app/pages/wallet.dart';
import 'package:flutter_banking_app/utils/styles.dart';

import 'home.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Styles.primaryColor,
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Styles.accentColor,
              ),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/logo.jpg'),
                ),
              )),
          ListTile(
            title: Text("Home",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          Divider(
            color: Styles.yellowColor,
            height: 15,
          ),
          ListTile(
            title: Text("Account",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Wallet()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Transactions",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Stats()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Send Money",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, MaterialPageRoute(builder:(context)=>SendMoney()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Recharge",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //    Navigator.push(context, MaterialPageRoute(builder:(context)=>CameraPage()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Asking for Credit",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //    Navigator.push(context, MaterialPageRoute(builder:(context)=>CameraPage()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Reclamations",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.push(context, MaterialPageRoute(builder:(context)=>Weather()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Call",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.push(context, MaterialPageRoute(builder:(context)=>Weather()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Messagerie",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.push(context, MaterialPageRoute(builder:(context)=>Weather()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Agency",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.push(context, MaterialPageRoute(builder:(context)=>Weather()));
            },
          ),
          Divider(color: Styles.yellowColor),
          ListTile(
            title: Text("Terms of Service",
                style: TextStyle(fontSize: 16, color: Colors.white)),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.push(context, MaterialPageRoute(builder:(context)=>Weather()));
            },
          ),
        ],
      ),
    );
  }
}
