import 'dart:convert' as convert;
import 'dart:io';
import 'package:flutter_banking_app/data/Transaction_response.dart';
import 'package:flutter_banking_app/data/meta_data.dart';
import 'package:flutter_banking_app/Model/transaction_model.dart';
import 'package:http/http.dart' as http;



class TransactionApi {
  Future<List<Transaction>?>? getTransction() async {
    //call api end point
    var url ='https://ms-transfert-nationale.herokuapp.com/transfert/transfers/';
        //Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    print("problem 1");

  http.Response   response = await http.get(Uri.parse(url));
    TransactionResponse transactionResponse;

      if (response.statusCode == 200) {

        var jsonResponse=convert.jsonDecode(response.body);
        print(jsonResponse);
        transactionResponse=TransactionResponse.fromJson(jsonResponse);


      }else{
        print("problem retriving data from server ");
    //    result.failure=

      }

      return null;


    //parse response
  }
}
