class Account{
  String ? id;
  String ? accountNumber;
  double ? solde;
  double ? credit;
  Account({this.id,this.accountNumber,this.solde,this.credit});
  Map<String,dynamic> toJson()=>{
    'id':id,
    'accountNumber':accountNumber,
    'solde':solde,
    'credit':credit,

  };
  Account.fromJson(Map<String,dynamic> json)
      : id = json["id"],
      accountNumber = json["accountNumber"],
      solde= json["solde"],
      credit=json["credit"];




}