// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../api/ApiManger.dart' as _i3;
import '../data/dataSource/BrandsOnlineDataSource.dart' as _i5;
import '../data/dataSource/CategoriesOnlineDataSource.dart' as _i9;
import '../data/dataSource/ProductsOnlineDataSource.dart' as _i16;
import '../data/dataSourceContract/BrandsDataSource.dart' as _i4;
import '../data/dataSourceContract/CategoriesDataSource.dart' as _i8;
import '../data/dataSourceContract/ProductsDataSource.dart' as _i15;
import '../data/repostory/BrandsRepositoryImpl.dart' as _i7;
import '../data/repostory/CategoriesRepositoryImpl.dart' as _i11;
import '../data/repostory/ProductsRepositoryImpl.dart' as _i18;
import '../domain/repository/BrandsRepository.dart' as _i6;
import '../domain/repository/CategoriesRepository.dart' as _i10;
import '../domain/repository/ProductsRepository.dart' as _i17;
import '../domain/useCases/getBrandsUseCase.dart' as _i12;
import '../domain/useCases/GetCategoriesUseCase.dart' as _i13;
import '../domain/useCases/GetMostSelling.dart' as _i19;
import '../ui/home/categories/ProductsTabViewModel.dart' as _i20;
import '../ui/home/homeTab/HomeTabViewModel.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.BrandsDataSource>(
        () => _i5.BrandsOnlineDataSource(gh<_i3.ApiManger>()));
    gh.factory<_i6.BrandsRepository>(
        () => _i7.BrandsRepositoryImpl(gh<_i4.BrandsDataSource>()));
    gh.factory<_i8.CategoriesDataSource>(
        () => _i9.CategoriesOnlineDataSource(gh<_i3.ApiManger>()));
    gh.factory<_i10.CategoriesRepository>(
        () => _i11.CategoriesRepositoryImpl(gh<_i8.CategoriesDataSource>()));
    gh.factory<_i12.GetBrandsUseCase>(
        () => _i12.GetBrandsUseCase(gh<_i6.BrandsRepository>()));
    gh.factory<_i13.GetCategoriesUseCase>(
        () => _i13.GetCategoriesUseCase(gh<_i10.CategoriesRepository>()));
    gh.factory<_i14.HomeTabViewModel>(() => _i14.HomeTabViewModel(
          gh<_i13.GetCategoriesUseCase>(),
          gh<_i12.GetBrandsUseCase>(),
        ));
    gh.factory<_i15.ProductsDataSource>(
        () => _i16.ProductsOnlineDataSource(gh<_i3.ApiManger>()));
    gh.factory<_i17.ProductsRepository>(
        () => _i18.ProductsRepositoryImpl(gh<_i15.ProductsDataSource>()));
    gh.factory<_i19.GetMostSelling>(
        () => _i19.GetMostSelling(gh<_i17.ProductsRepository>()));
    gh.factory<_i20.ProductTabViewModel>(
        () => _i20.ProductTabViewModel(gh<_i19.GetMostSelling>()));
    return this;
  }
}
