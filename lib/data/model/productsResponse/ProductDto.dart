import 'package:ecommerce/data/model/brandsResponse/BrandsDto.dart';
import 'package:ecommerce/data/model/categoriesResponse/CategoryDto.dart';
import 'package:ecommerce/domain/model/Product.dart';

import '../../../domain/model/Brand.dart';
import '../../../domain/model/Category.dart';
import 'SubcategoryDto.dart';


/// sold : 8841
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680403156555-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156555-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156554-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680403156556-4.jpeg"]
/// subcategory : [{"_id":"6407f1bcb575d3b90bf95797","name":"Women's Clothing","slug":"women's-clothing","category":"6439d58a0049ad0b52b9003f"}]
/// ratingsQuantity : 18
/// _id : "6428ead5dc1175abc65ca0ad"
/// title : "Woman Shawl"
/// slug : "woman-shawl"
/// description : "Material\tPolyester Blend\nColour Name\tMulticolour\nDepartment\tWomen"
/// quantity : 220
/// price : 149
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680403156501-cover.jpeg"
/// category : {"_id":"6439d58a0049ad0b52b9003f","name":"Women's Fashion","slug":"women's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"}
/// brand : {"_id":"64089bbe24b25627a253158b","name":"DeFacto","slug":"defacto","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285758109.png"}
/// ratingsAverage : 4.8
/// createdAt : "2023-04-02T02:39:17.204Z"
/// updatedAt : "2024-03-28T13:48:14.044Z"
/// id : "6428ead5dc1175abc65ca0ad"

class ProductDto {
  ProductDto({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt, 
      });

  ProductDto.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandsDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }
  num? sold;
  List<String>? images;
  List<SubcategoryDto>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryDto? category;
  BrandsDto? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
ProductDto copyWith({  num? sold,
  List<String>? images,
  List<SubcategoryDto>? subcategory,
  num? ratingsQuantity,
  String? id,
  String? title,
  String? slug,
  String? description,
  num? quantity,
  num? price,
  String? imageCover,
  CategoryDto? category,
  BrandsDto? brand,
  num? ratingsAverage,
  String? createdAt,
  String? updatedAt,
}) => ProductDto(  sold: sold ?? this.sold,
  images: images ?? this.images,
  subcategory: subcategory ?? this.subcategory,
  ratingsQuantity: ratingsQuantity ?? this.ratingsQuantity,
  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  description: description ?? this.description,
  quantity: quantity ?? this.quantity,
  price: price ?? this.price,
  imageCover: imageCover ?? this.imageCover,
  category: category ?? this.category,
  brand: brand ?? this.brand,
  ratingsAverage: ratingsAverage ?? this.ratingsAverage,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }
  Product toProduct (){
    return Product(
    id: id,
    slug: slug,
    title: title,
    description: description,
    brand: brand?.toBrand(),
    category: category?.toCategory(),
    imageCover: imageCover,
    images: images,
    price: price,
    quantity: quantity,
    ratingsAverage: ratingsAverage,
    ratingsQuantity: ratingsQuantity,
    sold: sold,
    subcategory: subcategory?.map((subDto) =>subDto.toSubcategory() ).toList(),
    );
  }

}