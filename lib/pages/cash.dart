import 'package:flutter/material.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/pages/send_money-cash.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/default_text_field.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';
class Cash extends StatefulWidget {

  @override
  _CashState createState() => _CashState();
}

class _CashState extends State<Cash> {
  final TextEditingController _cardHolderName = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  List paymentCardsList = [
    Assets.cardsVisa,
    Assets.cardsMastercard,
    Assets.cardsPaypal,
    Assets.cardsSkrill
  ];
  int selectedCard = 0;
  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    final cardSize = size.height * 0.23;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(title: 'Send Money', implyLeading: true, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [

          const Gap(30),
          DefaultTextField(
              controller: _cardHolderName, title: 'First Name'),
          DefaultTextField(
              controller: _cardNumber,
              title: 'Last Name',

              label: 'Last Name'),
          Row(
            children: [
              Flexible(
                child: DefaultTextField(
                    controller: _cardNumber,
                    title: 'CIN',
                    label: 'CIN'),
              ),
              const Gap(10),
              Flexible(
                child: DefaultTextField(
                    controller: _cardNumber,
                    title: 'Phone Number',
                    label: 'Phone Number'
                    ),
              ),
            ],
          ),
          const Gap(10),
          elevatedButton(
            color: Styles.blueColor,
            context: context,
            callback: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CashMoney()));
            },
            text: 'Next',
          )
        ],
      ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: const TextStyle(fontSize: 12)),
        const Gap(10),
        Text(subtitle, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
