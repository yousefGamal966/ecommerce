import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetCategoriesUseCase {
  CategoriesRepository repository;
 @factoryMethod GetCategoriesUseCase(this.repository);
  Future<List<Category>?> invoke(){
    return repository.getCategories();
}
}