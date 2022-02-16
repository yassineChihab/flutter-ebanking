class MetaData
{
  int ?code;
  String? developperMessage;
  UserMessage? userMessage;
  MetaData();


  factory MetaData.fromJson(Map<String,dynamic> json)
  {
    MetaData d=MetaData();
    d.code=json['code'];
    d.developperMessage=json['developper_message'];
    d.userMessage=UserMessage.fromJson(json['user_message']);
    return d;
  }
}

class UserMessage
{
    String? message;
    UserMessage();
    factory UserMessage.fromJson(Map<String,dynamic> json)
    {
      UserMessage userMessage=UserMessage();
      userMessage.message=json["en"];

      return userMessage;
    }
}