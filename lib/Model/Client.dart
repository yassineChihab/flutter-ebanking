import 'Account.dart';
class Client{
  String? iid;
  String? ffirstName;
  String? llastName;
  String? aaddress;
  String? ttel;
  Account? aaccount;
  String? ttoken;


  Client({this.iid, this.ffirstName, this.llastName, this.aaddress, this.ttel,
      this.aaccount, this.ttoken});

  Map<String,dynamic> toJson() =>{
    "id":iid,
    "firstName":ffirstName,
    "lastName":llastName,
    "address":aaddress,
    "tel":ttel,
    "token":ttoken,
    "account":aaccount
  };

  Client.fromJson(Map<String,dynamic> json)
  : iid=json["id"],
   ffirstName=json["firstName"],
   llastName=json["lastName"],
   aaddress=json["address"],
   ttel=json["tel"],
   ttoken=json["token"],
  aaccount=Account.fromJson(json["account"]);
  

}