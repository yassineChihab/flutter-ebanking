import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/Model/api_response.dart';
import 'package:flutter_banking_app/Model/transaction_model.dart';
import 'package:http/http.dart' as http;

class TransactionService
{
  static final  API=Uri.parse('https://ms-transfert-nationale.herokuapp.com/transfert/transfers/');
    Future<ApiResponse<List<Transaction>>> getTransactionList()
     {
      print('inside transaction');
      http.Response response= http.get(API) as http.Response;
      print('Response body: ${response.body}');
      return http.get(API)
          .then((data){
            if(data.statusCode==200)
              {
                print('well done');

                final jsonData=json.decode(data.body);
                  final transactions=<Transaction>[];
                  for(var item in jsonData){
                    final transaction=Transaction(
                      id: item['id'],
                      date: item['date'],
                      amount: item['amount'],
                      idBeneficiaire: item['idBeneficiaire']
                    );
                    transactions.add(transaction);

                  }
                  return ApiResponse<List<Transaction>>(
                    data: transactions
                  );

              }
            return ApiResponse<List<Transaction>>(error: true,errorMessage:'rrrrrrrrr');

      }).catchError((_)=>ApiResponse<List<Transaction>>(error: true,errorMessage:'anrrrrrrccured'));

    }
}