
import 'package:ecommerce/DialogUtils.dart';
import 'package:ecommerce/di/di.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/domain/model/Product.dart';
import 'package:ecommerce/ui/home/homeTab/HomeCategoryWidget.dart';
import 'package:ecommerce/ui/home/productsTab/ProductsTabViewModel.dart';
import 'package:ecommerce/ui/home/productsTab/ProductsTabWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {

  ProductsTabViewModel viewModel = getIt<ProductsTabViewModel>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProductsTabViewModel,ProductsTabState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is Error) return false;
        if (current is Loading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is Error) return true;
        if (current is Loading) return true;
        return false;
      },

      builder:(context, state) {
        if (state is Success){
          return buildSuccessStateWidget(state.products??[]);
        }
        return  Center(child:CircularProgressIndicator() ,);

      },
      listener: (context, state) {
        if (state is Loading){
          DialogUtils.showLoading(context, 'Loading..');
        }
        if (state is Error ){
          DialogUtils.showMessage(context, 'Something Is Wrong',posActionTitle: 'OK');
          print(state.message);
        }
      },


    );

  }
  Widget buildSuccessStateWidget(List<Product>products) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return  CategoriesWidget(products[index]);

              },itemCount: products.length,)
        ),

      ],
    ) ;

  }
}