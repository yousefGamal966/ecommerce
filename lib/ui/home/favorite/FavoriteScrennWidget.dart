import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Providers/AuthProvider.dart';
import 'package:ecommerce/data/database/FavoritesDao.dart';
import 'package:ecommerce/data/database/ProductsDao.dart';
import 'package:ecommerce/data/database/model/Favorite.dart';
import 'package:ecommerce/data/database/model/ProductCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../DialogUtils.dart';

class FavoriteScrennWidget extends StatefulWidget {
  Favorite favorite;
  FavoriteScrennWidget(this.favorite);

  @override
  State<FavoriteScrennWidget> createState() => _CartScreenWidgetState();
}

class _CartScreenWidgetState extends State<FavoriteScrennWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            children: [
              CachedNetworkImage(imageUrl: widget.favorite.image??"",height: 113,width: 120,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),),
              Expanded(
                child: Column(
                  children: [
                    Text(widget.favorite.title??""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("${widget.favorite.rate}"),
                            Icon(Icons.star,color: Colors.amber,),
                          ],
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.red)
                          ),
                          onPressed: (){
                            deleteTask();

                          }, child: Text('Remove',style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 14
                                                  ),),),

                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ),

      ],
    );
  }

  void deleteTask() {

    DialogUtils.showMessage(context,'Are You Sure To Delete This Task',posAction:(){
      deleteTaskFromFireStore();
    },posActionTitle: 'Yes',negActionTitle:'No' );

  }
  void deleteTaskFromFireStore()async {
    var authProvider = Provider.of<AuthProviders>(context,listen: false);
    await FavoritesDao.removeFavProduct(widget.favorite.id!,authProvider.databaseUser!.id!);

  }
}
