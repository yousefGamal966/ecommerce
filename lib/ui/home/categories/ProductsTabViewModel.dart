import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/domain/useCases/GetMostSelling.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/model/Brand.dart';
import '../../../domain/model/Category.dart';
@injectable
class ProductTabViewModel extends Cubit<ProductTabState>{
  GetMostSelling mostSelling;
  @factoryMethod ProductTabViewModel(this.mostSelling):super(Loading());
  void initPage()async {
    emit(Loading());
    try {
      var products = await mostSelling.invoke();
      emit(Success(products));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}
sealed class ProductTabState{}
class Loading extends ProductTabState{}
class Error extends ProductTabState{
  String? message;
  Error(this.message);
}
class Success extends ProductTabState{
List<Product>? products;
Success(this.products);
}