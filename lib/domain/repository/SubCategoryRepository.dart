
import 'package:ecommerce/domain/model/Category.dart';

import '../model/SubCategory.dart';

abstract class SubCategoryRepository {
  Future<List<Category>?> getSubCategories (String catId);
}