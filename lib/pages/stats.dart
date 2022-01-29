import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/json/transactions.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  List<Color> gradientColors = [
    Styles.blueColor,
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: 'Statistics',
          implyLeading: true,
          context: context,
          hasAction: true),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.primaryWithOpacityColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
                    child: Text('Total Balance',
                        style:
                            TextStyle(color: Colors.white.withOpacity(0.8)))),
                Divider(
                  color: Styles.primaryColor,
                  thickness: 2,
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                    child: const Text('\$20,000.00 USD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          const Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Transactions',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const Gap(20),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: transactions.length,
            itemBuilder: (c, i) {
              final trs = transactions[i];
              return ListTile(
                isThreeLine: true,
                minLeadingWidth: 10,
                minVerticalPadding: 0,
                contentPadding: const EdgeInsets.all(0),
                leading: Container(
                  width: 35,
                  height: 35,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Styles.primaryWithOpacityColor,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 2,
                          spreadRadius: 1)
                    ],
                    image: i == 0
                        ? null
                        : DecorationImage(
                            image: AssetImage(trs['avatar']),
                            fit: BoxFit.cover,
                          ),
                    shape: BoxShape.circle,
                  ),
                  child: i == 0
                      ? Icon(trs['icon'],
                          color: const Color(0xFFFF736C), size: 20)
                      : const SizedBox(),
                ),
                title: Text(trs['name'],
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text(trs['date'],
                    style: TextStyle(color: Colors.white.withOpacity(0.5))),
                trailing: Text(trs['amount'],
                    style: const TextStyle(fontSize: 17, color: Colors.white)),
              );
            },
          )
        ],
      ),
    );
  }


}
