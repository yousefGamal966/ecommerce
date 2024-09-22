import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/Product.dart';

class ProductsWidget extends StatelessWidget {
  Product product;

   ProductsWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(

          borderRadius: BorderRadius.circular(64),
          child: CachedNetworkImage(
            width: 132,
            height: 100,
            imageUrl: product.imageCover??"",
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(child: Text(error.toString())),
          ),
        ),
        Text(product.title??"")
      ],
    );

  }
}
