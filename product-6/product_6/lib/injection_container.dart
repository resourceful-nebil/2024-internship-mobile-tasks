import 'dart:async';
import 'dart:io';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'core/connections/network_info.dart';
import 'features/product/data/data_sources/product_local_data_source.dart';
import 'features/product/data/data_sources/product_remote_datasource.dart';
import 'features/product/data/repository/product_repository_imp.dart';
import 'features/product/domain/repository/product_repository.dart';
import 'features/product/domain/usecases/create_product.dart';
import 'features/product/domain/usecases/delete_product.dart';
import 'features/product/domain/usecases/update_product.dart';
import 'features/product/domain/usecases/view_all_products.dart';
import 'features/product/domain/usecases/view_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  locator.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  locator.registerLazySingleton<http.Client>(() => http.Client());

  // Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  // Data sources
  locator.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDatasourceImp(client: locator()));

  // Repository
  locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
        productRemoteDatasource: locator(),
        networkInfo: locator(),
        productLocalDataSource: locator(),
      ));

  // Use cases
  locator.registerLazySingleton<CreateProductUseCase>(
      () => CreateProductUseCase(locator()));
  locator.registerLazySingleton<DeleteProductUseCase>(
      () => DeleteProductUseCase(locator()));
  locator.registerLazySingleton<UpdateProductUseCase>(
      () => UpdateProductUseCase(locator()));
  locator.registerLazySingleton<ViewAllProductsUseCase>(
      () => ViewAllProductsUseCase(locator()));
  locator.registerLazySingleton<ViewProductUseCase>(
      () => ViewProductUseCase(locator()));

  // Bloc
  locator.registerFactory<ProductBloc>(() => ProductBloc(
        createProductUseCase: locator(),
        deleteProductUseCase: locator(),
        updateProductUseCase: locator(),
        viewAllProductsUseCase: locator(),
        viewProductUseCase: locator(),
      ));
}














// import 'dart:async';
// import 'dart:io';

// import 'package:data_connection_checker_tv/data_connection_checker.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'core/connections/network_info.dart';
// import 'features/product/data/data_sources/product_local_data_source.dart';
// import 'features/product/data/data_sources/product_remote_datasource.dart';
// import 'features/product/data/repository/product_repository_imp.dart';
// import 'features/product/domain/repository/product_repository.dart';
// import 'features/product/domain/usecases/create_product.dart';
// import 'features/product/domain/usecases/delete_product.dart';
// import 'features/product/domain/usecases/update_product.dart';
// import 'features/product/domain/usecases/view_all_products.dart';
// import 'features/product/domain/usecases/view_product.dart';
// import 'features/product/presentation/bloc/product_bloc.dart';

// final GetIt locator = GetIt.instance;

// Future<void> setupLocator() async {
//   //Bloc
//   locator.registerFactory<ProductBloc>(() => ProductBloc(
//         createProductUseCase: locator(),
//         deleteProductUseCase: locator(),
//         updateProductUseCase: locator(),
//         viewAllProductsUseCase: locator(),
//         viewProductUseCase: locator(),
//       ));

//   //usecases
//   locator.registerLazySingleton<CreateProductUseCase>(
//       () => CreateProductUseCase(locator()));
//   locator.registerLazySingleton<DeleteProductUseCase>(
//       () => DeleteProductUseCase(locator()));
//   locator.registerLazySingleton<UpdateProductUseCase>(
//       () => UpdateProductUseCase(locator()));
//   locator.registerLazySingleton<ViewAllProductsUseCase>(
//       () => ViewAllProductsUseCase(locator()));
//   locator.registerLazySingleton<ViewProductUseCase>(
//       () => ViewProductUseCase(locator()));

//   //repository
//   locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImp(
//         productRemoteDatasource: locator(),
//         networkInfo: locator(),
//         productLocalDataSource: locator(),
//       ));

//   //data
//   locator.registerLazySingleton<ProductLocalDataSource>(
//       () => ProductLocalDataSourceImpl(sharedPreferences: locator()));
//   locator.registerLazySingleton<ProductRemoteDatasource>(
//       () => ProductRemoteDatasourceImp(client: locator()));

//   //core
//   locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

//   //external
//   final sharedpref = await SharedPreferences.getInstance();
//   locator.registerLazySingleton<SharedPreferences>(() => sharedpref);
//   locator.registerLazySingleton<DataConnectionChecker>(
//       () => DataConnectionChecker());
//   locator.registerLazySingleton<HttpClient>(() => HttpClient());
// }
