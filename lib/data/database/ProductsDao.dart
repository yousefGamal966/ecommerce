import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/database/UsersDao.dart';
import 'package:ecommerce/data/database/model/ProductCart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class ProductsDao {
  static CollectionReference<ProductCart> getProductsCollection(String uid) {
    return UsersDao.getUsersCollection()
        .doc(uid)
        .collection(ProductCart.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              ProductCart.fromFireStore(snapshot.data()),
          toFirestore: (product, options) => product.toFireStore(),
        );
  }

  static Future<void> createProduct(ProductCart product, String uid) {
    var doc = getProductsCollection(uid).doc();
    product.id = doc.id;
    return doc.set(product);
  }
  static Future<List<ProductCart>> getAllProduct(String uid) async {
     var productSnapshot = await getProductsCollection(uid).get();

    var tasksList =
        productSnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return tasksList;
  }

  static Stream<List<ProductCart>> listenForProducts(String uid) async* {

    var productSnapshot =  getProductsCollection(uid).snapshots();

    yield* productSnapshot.map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());

  }

  static Future<void> removeProduct(String productId, String uid) {
    return getProductsCollection(uid).doc(productId).delete();
  }

}
