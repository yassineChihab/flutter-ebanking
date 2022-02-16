import 'package:flutter_banking_app/data/meta_data.dart';
import 'package:flutter_banking_app/Model/transaction_model.dart';

class TransactionResponse{
  MetaData? metaData;
  List<Transaction>? data;
  TransactionResponse();


  factory TransactionResponse.fromJson(Map<String,dynamic> json)
  {
    TransactionResponse transactionResponse=TransactionResponse();
    transactionResponse.metaData=MetaData.fromJson(json['meta_data']);
    transactionResponse.data=[];
    for(var t in json['data'])
      {
        Transaction temp=Transaction.fromJson(t);
        transactionResponse.data?.add(temp);
      }
    return transactionResponse;
  }


}