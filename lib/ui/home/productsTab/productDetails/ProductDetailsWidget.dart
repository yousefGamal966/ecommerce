
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../DialogUtils.dart';
import '../../../../Providers/AuthProvider.dart';
import '../../../../data/database/FavoritesDao.dart';
import '../../../../data/database/ProductsDao.dart';
import '../../../../data/database/model/Favorite.dart';
import '../../../../data/database/model/ProductCart.dart';
import '../../../../domain/model/Product.dart';
import '../../../cartScreen/CartScreen.dart';

class ProductDetailsWidget extends StatefulWidget {
  Product product;
   ProductDetailsWidget(this.product);

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(imageUrl: widget.product.imageCover??"",height: 400,width: double.infinity,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.product.title??"",style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                    ),),
                  ),
                  Text("EGP ${widget.product.price}",style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                  ),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${widget.product.sold} SOLD",style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                  ),),
                  Row(
                    children: [Icon(Icons.star,color: Colors.amber,),
                      Text("${widget.product.ratingsAverage}(${widget.product.ratingsQuantity})")],

                  )

                ],
              ),
              Row(
                children: [
                  Text('Description',style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                  ),),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(widget.product.description??"",style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,color: Colors.grey
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Total Price',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,color: Colors.black
                      ),),
                      Text('EGP  ${widget.product.price}',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,color: Colors.black
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Color(0xFF004181),)
                          ),
                          onPressed: (){
                            addProductToCart();



                          }, child: Text('Add to Cart',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,color: Colors.white
                      ),)),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.amber)
                          ),
                          onPressed: (){
                            addProductToFavorite();



                          }, child: Text('Add to Favorite Tab',style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,color: Colors.white
                      ),)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  void addProductToCart()async {
    var authProvider = Provider.of<AuthProviders>(context,listen: false);

    ProductCart productCart = ProductCart(
        title: widget.product.title,
        description: widget.product.description,
        rate: widget.product.ratingsAverage,
        id: widget.product.id,
        image: widget.product.imageCover,
        price: widget.product.price

    );
    DialogUtils.showLoading(context,'Adding Product to Your Cart Please Wait.');
    await ProductsDao.createProduct(productCart, authProvider.databaseUser!.id!);
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context,'Product Added Successfully',isCancelable: false,
        posActionTitle:'OK',posAction: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen() ,) );
        });

  }

  void addProductToFavorite()async {
    var authProvider = Provider.of<AuthProviders>(context,listen: false);

    Favorite favorite = Favorite(
        title: widget.product.title,
        rate: widget.product.ratingsAverage,
        id: widget.product.id,
        image: widget.product.imageCover,
        price: widget.product.price

    );
    DialogUtils.showLoading(context,'Adding Product to Your Cart Please Wait.');
    await FavoritesDao.createFavProduct(favorite, authProvider.databaseUser!.id!);
    DialogUtils.hideDialog(context);
    DialogUtils.showMessage(context,'Product Added Successfully',isCancelable: false,
        posActionTitle:'OK',posAction: (){
          Navigator.pop(context);
        });

  }
}
