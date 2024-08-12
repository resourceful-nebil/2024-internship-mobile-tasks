import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'package:product_6/core/connections/network_info.dart';
import 'package:product_6/features/product/data/data_sources/product_remote_datasource.dart';
import 'package:product_6/features/product/domain/repository/product_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  ProductRepository,
  ProductRemoteDatasource,
  DataConnectionChecker,
  NetworkInfo,
  http.Client,
  SharedPreferences,
])
void main() {}

