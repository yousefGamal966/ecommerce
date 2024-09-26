import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCart {
  static const String collectionName = 'tasks';
  String? id;
  String? title;
  String? description;
  num? rate;
  String? image;
  num? price;

  ProductCart(
  {
    this.id,this.title,this.description,this.rate,this.image,  this.price
}
      );
  ProductCart.fromFireStore (Map<String,dynamic>?data):this(
    id: data?['id'],
    title: data?['title'],
    description: data?['description'],
    rate: data?['rate'],
    image: data?['image']  ,
    price: data?['price']
  );
  Map<String,dynamic> toFireStore (){
    return {
      'id' :id,
      'title':title,
      'description':description,
      'rate':rate,
      'image':image,
      'price':price
    };
  }
}