import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/Providers/CartProvider.dart';
import 'package:ecommerce/Providers/FavoriteProvider.dart';
import 'package:ecommerce/data/database/FavoritesDao.dart';
import 'package:ecommerce/data/database/model/User.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/ui/home/favorite/FavoriteScrennWidget.dart';
import 'package:ecommerce/ui/home/productsTab/ProductsTabViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoritesTab extends StatefulWidget {
  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProviders>(context);
    var favProvider =Provider.of<FavoriteProvider>(context);
    var cart =Provider.of<CartProvider>(context);

    return Scaffold(
        appBar: AppBar(

        ),
        body: StreamBuilder(
          stream:FavoritesDao.listenForFavProducts(auth.firebaseAuthUser!.uid),
          builder: (context, snapshot) {
            print('+++++++++++');
            print(auth.firebaseAuthUser!.uid);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),

              );

            }
            if(snapshot.hasError)
            {
              print(snapshot.error);
              print('++++++++++');
              return Container(height: 100,width: 100,color: Colors.red,);
            }
            var productsList = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return FavoriteScrennWidget(productsList![index]);
              },
              itemCount: productsList?.length ?? 0,
            );
          },
        )
    );
  }
}