import 'package:flutter/cupertino.dart';
import 'package:flutter_banking_app/data/Transaction_api.dart';
import 'package:flutter_banking_app/Model/transaction_model.dart';


enum ListScreenState{initial,loading,loaded}
class TransactionListProvider with ChangeNotifier{
  ListScreenState state=ListScreenState.initial;

  List<Transaction>? listTransaction;


  getTransaction()async
  {
    listTransaction=await TransactionApi().getTransction();
    state=ListScreenState.loaded;
    notifyListeners();


  }

}