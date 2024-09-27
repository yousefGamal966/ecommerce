import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/database/UsersDao.dart';
import 'package:ecommerce/data/database/model/Favorite.dart';

class FavoritesDao {
  static CollectionReference<Favorite> getFavCollection(String uid) {
    return UsersDao.getUsersCollection()
        .doc(uid)
        .collection(Favorite.collectionName)
        .withConverter(
      fromFirestore: (snapshot, options) =>
          Favorite.fromFireStore(snapshot.data()),
      toFirestore: (product, options) => product.toFireStore(),
    );
  }

  static Future<void> createFavProduct(Favorite product, String uid) {
    var doc = getFavCollection(uid).doc();
    product.id = doc.id;
    return doc.set(product);
  }
  static Future<List<Favorite>> getAllFavProduct(String uid) async {
    var favSnapshot = await getFavCollection(uid).get();

    var tasksList =
    favSnapshot.docs.map((snapshot) => snapshot.data()).toList();
    return tasksList;
  }

  static Stream<List<Favorite>> listenForFavProducts(String uid) async* {

    var favSnapshot =  getFavCollection(uid).snapshots();

    yield* favSnapshot.map((querySnapshot) =>
        querySnapshot.docs.map((doc) => doc.data()).toList());

  }

  static Future<void> removeFavProduct(String productId, String uid) {
    return getFavCollection(uid).doc(productId).delete();
  }

}
