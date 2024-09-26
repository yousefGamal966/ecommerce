// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/ApiManger.dart' as _i881;
import '../data/dataSource/BrandsOnlineDataSource.dart' as _i922;
import '../data/dataSource/CategoriesOnlineDataSource.dart' as _i189;
import '../data/dataSource/ProductsOnlineDataSource.dart' as _i721;
import '../data/dataSource/SpecificProductDataSource.dart' as _i662;
import '../data/dataSource/SubCategoryDataSource.dart' as _i225;
import '../data/dataSourceContract/BrandsDataSource.dart' as _i978;
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i547;
import '../data/dataSourceContract/ProductsDataSource.dart' as _i64;
import '../data/dataSourceContract/SpecificProductDataSourceContract.dart'
    as _i64;
import '../data/dataSourceContract/SubCategoryDataSourceContract.dart' as _i527;
import '../data/repostory/BrandsRepositoryImpl.dart' as _i960;
import '../data/repostory/CategoriesRepositoryImpl.dart' as _i876;
import '../data/repostory/ProductsRepositoryImpl.dart' as _i178;
import '../data/repostory/SpecificProductRepositoryImpl.dart' as _i887;
import '../data/repostory/SubCategoryRepositoryImpl.dart' as _i411;
import '../domain/repository/BrandsRepository.dart' as _i362;
import '../domain/repository/CategoriesRepository.dart' as _i210;
import '../domain/repository/ProductsRepository.dart' as _i637;
import '../domain/repository/SpecificProductRepository.dart' as _i536;
import '../domain/repository/SubCategoryRepository.dart' as _i877;
import '../domain/useCases/getBrandsUseCase.dart' as _i942;
import '../domain/useCases/GetCategoriesUseCase.dart' as _i242;
import '../domain/useCases/GetMostSelling.dart' as _i490;
import '../domain/useCases/GetSubCategoriesUseCase.dart' as _i30;
import '../domain/useCases/SpecificProductUseCase.dart' as _i574;
import '../ui/home/homeTab/HomeTabViewModel.dart' as _i314;
import '../ui/home/productsTab/productDetails/ProductDetailsScreenViewModel.dart'
    as _i26;
import '../ui/home/productsTab/ProductsTabViewModel.dart' as _i103;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i881.ApiManger>(() => _i881.ApiManger());
    gh.factory<_i64.ProductsDataSource>(
        () => _i721.ProductsOnlineDataSource(gh<_i881.ApiManger>()));
    gh.factory<_i637.ProductsRepository>(
        () => _i178.ProductsRepositoryImpl(gh<_i64.ProductsDataSource>()));
    gh.factory<_i64.SpecificProductDataSourceContract>(
        () => _i662.SpecificProductDataSource(gh<_i881.ApiManger>()));
    gh.factory<_i527.SubCategoryDataSourceContract>(
        () => _i225.SubCategoryDataSource(gh<_i881.ApiManger>()));
    gh.factory<_i536.SpecificProductRepository>(() =>
        _i887.SpecificProductRepositoryImpl(
            gh<_i64.SpecificProductDataSourceContract>()));
    gh.factory<_i547.CategoriesDataSource>(
        () => _i189.CategoriesOnlineDataSource(gh<_i881.ApiManger>()));
    gh.factory<_i978.BrandsDataSource>(
        () => _i922.BrandsOnlineDataSource(gh<_i881.ApiManger>()));
    gh.factory<_i210.CategoriesRepository>(
        () => _i876.CategoriesRepositoryImpl(gh<_i547.CategoriesDataSource>()));
    gh.factory<_i574.SpecificProductUseCase>(() =>
        _i574.SpecificProductUseCase(gh<_i536.SpecificProductRepository>()));
    gh.factory<_i877.SubCategoryRepository>(() =>
        _i411.SubCategoryRepositoryImpl(
            gh<_i527.SubCategoryDataSourceContract>()));
    gh.factory<_i362.BrandsRepository>(
        () => _i960.BrandsRepositoryImpl(gh<_i978.BrandsDataSource>()));
    gh.factory<_i30.GetSubCategoriesUseCase>(
        () => _i30.GetSubCategoriesUseCase(gh<_i877.SubCategoryRepository>()));
    gh.factory<_i942.GetBrandsUseCase>(
        () => _i942.GetBrandsUseCase(gh<_i362.BrandsRepository>()));
    gh.factory<_i490.GetMostSelling>(
        () => _i490.GetMostSelling(gh<_i637.ProductsRepository>()));
    gh.factory<_i26.ProductDetailsScreenViewModel>(() =>
        _i26.ProductDetailsScreenViewModel(gh<_i574.SpecificProductUseCase>()));
    gh.factory<_i242.GetCategoriesUseCase>(
        () => _i242.GetCategoriesUseCase(gh<_i210.CategoriesRepository>()));
    gh.factory<_i103.ProductsTabViewModel>(() => _i103.ProductsTabViewModel(
          gh<_i490.GetMostSelling>(),
          gh<_i30.GetSubCategoriesUseCase>(),
          gh<_i242.GetCategoriesUseCase>(),
        ));
    gh.factory<_i314.HomeTabViewModel>(() => _i314.HomeTabViewModel(
          gh<_i242.GetCategoriesUseCase>(),
          gh<_i942.GetBrandsUseCase>(),
        ));
    return this;
  }
}
