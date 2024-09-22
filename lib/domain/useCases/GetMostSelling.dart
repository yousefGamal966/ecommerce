import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/repository/ProductsRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostSelling{
  ProductsRepository productsRepository;
  @factoryMethod GetMostSelling(this.productsRepository);
  Future<List<Product>?> invoke (){
    return productsRepository.getProducts();
  }

}