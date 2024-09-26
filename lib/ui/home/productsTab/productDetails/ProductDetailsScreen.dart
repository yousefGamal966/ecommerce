import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/data/database/FavoritesDao.dart';
import 'package:ecommerce/data/database/ProductsDao.dart';
import 'package:ecommerce/data/database/model/Favorite.dart';
import 'package:ecommerce/data/database/model/ProductCart.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/ui/home/productsTab/productDetails/ProductDetailsWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../DialogUtils.dart';
import '../../../../Providers/AuthProvider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = 'product';
Product product;

ProductDetailsScreen({required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor:  Color(0xFFFDFDFD),

        title: Text("${widget.product.category?.name}")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductDetailsWidget(widget.product)
            ],
          )
        ),

    );

  }


}
