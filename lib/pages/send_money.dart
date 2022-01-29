import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/pages/Single_transfret.dart';
import 'package:flutter_banking_app/pages/add_card.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/people_slider.dart';
import 'package:gap/gap.dart';
import 'dart:math' as math;

import 'home.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar:
      myAppBar(title: 'Send Money', implyLeading: true, context: context),
      bottomSheet: Container(
        color: Styles.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: elevatedButton(
          color: Colors.red,
          context: context,
          callback: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          text: 'Exit',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Styles.primaryWithOpacityColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(Assets.cardsVisaWhite,
                            width: 60, height: 45, fit: BoxFit.cover),
                        const Padding(
                          padding: EdgeInsets.only(top: 20, right: 5),
                          child: Text('\20,000.00 DH',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                    const Gap(24),
                    customColumn(
                        title: 'CARD NUMBER', subtitle: '3829 4820 4629 5025'),
                    const Gap(15),
                  ],
                ),
              ),
            ],
          ),
          const Gap(20),
          //  const PeopleSlider(),
          const Gap(10),
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
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\2000.00',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold)),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Styles.primaryColor,
                          ),
                          child: Row(
                            children: [
                              const Text('DH',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const Gap(8),
                            ],
                          )),
                    ],
                  ),
                ),
                Divider(color: Styles.primaryColor, thickness: 2),
                Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text('Send Money Limit',
                        style:
                        TextStyle(color: Colors.white.withOpacity(0.7)))),
                const Gap(10),
              ],
            ),
          ),
          const Gap(100),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Styles.accentColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                        const Text('Single Transfer',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Styles.primaryColor,
                        ),
                        child: Row(

                            children: [
                        InkWell(
                        onTap:() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleTransfert()));

                        },
                         child: Image.asset("assets/svg/arrow.png"),
                  ),

                  /* const Text('DH',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),*/
                  const Gap(8),
                ],
              )),
        ],
      ),
    ),

    ],
    ),
    ),
    const Gap(20),
    Container(
    width: double.infinity,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Styles.accentColor,
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    const Text('Multiple Transfer',
    style: TextStyle(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold)),
    Container(
    padding: const EdgeInsets.symmetric(
    horizontal: 18, vertical: 12),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(18),
    color: Styles.primaryColor,
    ),
    child: Row(

    children: [
    Image.asset("assets/svg/arrow.png"),
    /* const Text('DH',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),*/
    const Gap(8),
    ],
    )),
    ],
    ),
    ),

    ],
    ),
    )
    ],
    ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style:
            TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5))),
        const Gap(2),
        Text(subtitle,
            style:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
      ],
    );
  }

  Widget customColumnV2({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style:
            TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5))),
        const Gap(2),
        Text(subtitle,
            style:
            TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
      ],
    );
  }
}
