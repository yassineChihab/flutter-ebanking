import 'package:flutter/cupertino.dart';

class Transaction{
  int ? id;
  DateTime? date;
  double? amount;
  int ?idBeneficiaire;

  Transaction({this.id, this.date, this.amount, this.idBeneficiaire});

   factory Transaction.fromJson(Map<String,dynamic> json)
  {
    Transaction t=Transaction();
    t.id=json['id'];
    t.date=json['date'];
    t.amount=json['amout'];
    t.idBeneficiaire=json['idBeneficiare'];


    return t;
  }


}