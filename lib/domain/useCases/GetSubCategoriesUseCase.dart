
import 'package:ecommerce/domain/model/Category.dart';
import 'package:injectable/injectable.dart';

import '../model/SubCategory.dart';
import '../repository/SubCategoryRepository.dart';
@injectable
class GetSubCategoriesUseCase {
  SubCategoryRepository repository;
 @factoryMethod GetSubCategoriesUseCase(this.repository);
 Future<List<Category>?> invoke(String catId){
   return repository.getSubCategories(catId);}
}