
class User {
  static const String collectionName = 'users';
  String? id;
  String? fullName;
  String? mobileNum;
  String? email;

  User({this.id,this.fullName,this.mobileNum,this.email});

  User.fromFireStore(Map<String,dynamic>? data):this(
    id : data?['id'],
    fullName : data?['fullName'],
    mobileNum : data? ['mobileNum'],
    email : data? ['email'],
  );

  Map<String,dynamic> toFireStore (){
    return{
      'id':id,
      'email':email,
      'fullName':fullName,
      'mobileNum':mobileNum
    };

  }
}