import 'package:ecommerce/domain/model/Brand.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/BrandsRepository.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetBrandsUseCase {
  BrandsRepository repository;
  @factoryMethod GetBrandsUseCase(this.repository);
  Future<List<Brand>?> invoke(){
    return repository.getBrand();
  }
}