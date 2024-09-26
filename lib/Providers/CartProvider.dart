import 'package:ecommerce/data/database/model/ProductCart.dart';
import 'package:flutter/material.dart';

import '../data/database/ProductsDao.dart';

class CartProvider extends ChangeNotifier{
  List<ProductCart> products = [];
  String? uid;
  Future<void> addProduct(ProductCart product)async{
    await ProductsDao.createProduct(product, uid!);
    notifyListeners();
    return;
}
Future<void> deleteProduct (ProductCart product)async{
    await ProductsDao.removeProduct(product.id!, uid!);
    notifyListeners();
    return;
}
Future<List<ProductCart>> getAllProduct (){
    return ProductsDao.getAllProduct(uid!);
}
Stream<List<ProductCart>> listenProducts()async*{
    yield* ProductsDao.listenForProducts(uid!);
}

}