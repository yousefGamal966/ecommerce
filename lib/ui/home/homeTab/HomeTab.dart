import 'package:ecommerce/DialogUtils.dart';
import 'package:ecommerce/api/ApiManger.dart';
import 'package:ecommerce/domain/model/Category.dart';
import 'package:ecommerce/ui/home/homeTab/HomeBrandWidget.dart';
import 'package:ecommerce/ui/home/homeTab/HomeCategoryWidget.dart';
import 'package:ecommerce/ui/home/homeTab/HomeTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/di.dart';
import '../../../domain/model/Brand.dart';
import '../../../domain/model/Product.dart';
class HomeTab extends StatefulWidget {

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();
  @override
  void initState() {
  super.initState();
  viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel,HomeTabState>(
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
            return buildSuccessStateWidget(state.categories??[],state.brands??[]);
          }
          return Center(child:CircularProgressIndicator() ,);

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

  Widget buildSuccessStateWidget(List<Category> categories,List<Brand>brands) {
    var mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediaQuery.height*0.03,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text('Categories',style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,color: Color(0xFF06004F)),),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              width: mediaQuery.width*1,
              height: mediaQuery.height*0.3,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2
              ), itemBuilder: (context, index) {
                return HomeCategoryWidget(category: categories[index]);
              },itemCount: categories.length,),
            ),
            SizedBox(height:mediaQuery.height*0.1 ,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text('Brands',style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,color: Color(0xFF06004F)),),
              ],
            ),
            Container(
              width: mediaQuery.width*1,
              height: mediaQuery.height*0.3,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2
                ), itemBuilder: (context, index) {
                return HomeBrandWidget(brands[index]);

              },itemCount: brands.length,),
            ),
          ],
        ),
    ) ;

  }
}
