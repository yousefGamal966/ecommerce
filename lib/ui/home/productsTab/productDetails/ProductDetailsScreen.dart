import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/ui/home/productsTab/productDetails/ProductDetailsScreenViewModel.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = 'product';
Product product;

ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${product.category?.name}")),
        body: Column(
          children: [
            CachedNetworkImage(imageUrl: product.imageCover??"",height: 400,width: double.infinity,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(product.title??"",style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                    ),),
                    Text("EGP ${product.price}",style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                    ),)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${product.sold} SOLD",style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,color: Color(0xFF06004F)
                      ),),
                      Row(
                        children: [Icon(Icons.star,color: Colors.amber,),
                          Text("${product.ratingsAverage}(${product.ratingsQuantity})")],

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
                      Text(product.description??"",style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,color: Colors.grey
                      ),),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text('Total Price'),
                          Text('EGP  ${product.price}'),
                        ],
                      ),
                      ElevatedButton(onPressed: (){

                      }, child: Text('Add to Cart'))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),

    );

  }
}
