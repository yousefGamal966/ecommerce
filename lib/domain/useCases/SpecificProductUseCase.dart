import 'package:ecommerce/domain/model/Product.dart';
import 'package:injectable/injectable.dart';

import '../repository/SpecificProductRepository.dart';

@injectable
class SpecificProductUseCase {
  SpecificProductRepository repository;
  @factoryMethod SpecificProductUseCase (this.repository);
  Future<List<Product>?> invoke(String id){
    return repository.getSpecificProduct(id);}
}

