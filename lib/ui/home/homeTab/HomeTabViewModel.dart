import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/useCases/GetMostSelling.dart';
import 'package:ecommerce/domain/useCases/getBrandsUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/Brand.dart';
import '../../../domain/model/Category.dart';
import '../../../domain/useCases/GetCategoriesUseCase.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabState>{
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;
 @factoryMethod HomeTabViewModel(this.getCategoriesUseCase,this.getBrandsUseCase):super(Loading());
  void initPage()async {
    emit(Loading());
    try {
      var brands = await getBrandsUseCase.invoke();
      var categories = await getCategoriesUseCase.invoke();
      emit(Success(categories,brands));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
sealed class HomeTabState{}
class Loading extends HomeTabState{}
class Error extends HomeTabState{
  String? message;
  Error(this.message);
}
class Success extends HomeTabState{
  List<Category>? categories;
  List<Brand>? brands;
  Success(this.categories,this.brands);
}