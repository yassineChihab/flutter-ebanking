import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/Main-drawer.dart';
import 'package:flutter_banking_app/pages/sign_in.dart';
import 'package:flutter_banking_app/providers/transaction_list_providers.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TransactionListProvider>(create: (_) => TransactionListProvider()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Banking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'DMSans',
        primaryColor: Styles.primaryColor,
        backgroundColor: Styles.primaryColor,
      ),
        home: const SignInPage(),

    );
  }
}
