import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/Category.dart';

class HomeCategoryWidget extends StatelessWidget {
  Category category;
   HomeCategoryWidget({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(64),
            child: CachedNetworkImage(
              width: 132,
              height: 100,
              imageUrl: category.image??"",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Text(category.name??"")
      ],
    );
  }
}
