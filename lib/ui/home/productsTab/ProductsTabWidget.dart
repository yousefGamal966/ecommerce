import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/ui/home/productsTab/productDetails/ProductDetailsScreen.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/Category.dart';
import '../../../domain/model/Product.dart';
import '../../../domain/model/SubCategory.dart';

class CategoriesWidget extends StatelessWidget {
  Product product;
   CategoriesWidget(this.product);

  @override
  Widget build(BuildContext context) {

       return Column(
         children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  ProductDetailsScreen(product: product,) ,) );
                  },
                  child: Card(
                    color:  Color(0xFFFDFDFD),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side:BorderSide(color: Color(
                       0xFF004181),width: 3) ),
                   child:Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 8),
                     child: SingleChildScrollView(
                       child: Stack(

                         children: [

                           Column(
                             children: [

                               CachedNetworkImage(imageUrl: product.imageCover??"" ,height: 120,width: 191,),
                               Text(product.title??""),
                               Row(
                                 children: [
                                   Text("${product.price??0} EGP"),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Text("${product.ratingsAverage??""}"),
                                   Icon(Icons.star,color: Colors.amber,)
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ) ,
                               ),
                ),
              ),

         ],
       );
    }
}

