import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  static const String collectionName = 'favorite';
  String? id;
  String? title;
  num? rate;
  String? image;
  num? price;

  Favorite(
      {
        this.id,this.title,this.rate,this.image,  this.price
      }
      );
  Favorite.fromFireStore (Map<String,dynamic>?data):this(
      id: data?['id'],
      title: data?['title'],
      rate: data?['rate'],
      image: data?['image']  ,
      price: data?['price']
  );
  Map<String,dynamic> toFireStore (){
    return {
      'id' :id,
      'title':title,
      'rate':rate,
      'image':image,
      'price':price
    };
  }
}