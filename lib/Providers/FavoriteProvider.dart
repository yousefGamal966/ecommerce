
import 'package:ecommerce/data/database/FavoritesDao.dart';
import 'package:ecommerce/data/database/model/Favorite.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  List<Favorite> products = [];
  String? uid;
  Future<void> addProduct(Favorite product)async{
    await FavoritesDao.createFavProduct(product, uid!);
    notifyListeners();
    return;
  }
  Future<void> deleteProduct (Favorite product)async{
    await FavoritesDao.removeFavProduct(product.id!, uid!);
    notifyListeners();
    return;
  }
  Future<List<Favorite>> getAllFavProduct (){
    return FavoritesDao.getAllFavProduct(uid!);
  }
  Stream<List<Favorite>> listenFavProducts()async*{
    yield* FavoritesDao.listenForFavProducts(uid!);
  }

}