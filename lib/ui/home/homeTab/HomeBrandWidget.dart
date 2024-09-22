import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/model/Brand.dart';
import 'package:flutter/material.dart';

class HomeBrandWidget extends StatelessWidget {
  Brand brand;
   HomeBrandWidget(this.brand);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          width: 132,
          height: 100,
          imageUrl: brand.image??"",
          placeholder: (context, url) => Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
        ),
      ],
    );
  }
}
