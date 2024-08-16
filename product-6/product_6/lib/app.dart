import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:product_6/features/product/presentation/pages/search.dart';
import 'package:product_6/features/product/presentation/pages/update_page.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/product/presentation/bloc/product_event.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'injection_container.dart';

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (context) => ProductBloc(
                createProductUseCase: locator(),
                deleteProductUseCase: locator(),
                updateProductUseCase: locator(),
                viewAllProductsUseCase: locator(),
                viewProductUseCase: locator())
              ..add(LoadAllProductEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
