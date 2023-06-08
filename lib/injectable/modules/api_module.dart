import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zadanko/app/utils/consts.dart';
import 'package:zadanko/data/data_source/retrofit_api_data_source_impl.dart';
import 'package:zadanko/domain/utils/interceptors/pretty_dio_logger_interceptor.dart';
import 'package:zadanko/main/flavors/flavor_config.dart';

@module
abstract class ApiModule {
  @injectable
  Dio get client => Dio(
        BaseOptions(
          contentType: defaultContentType,
          connectTimeout: 30000,
          receiveTimeout: 30000,
        ),
      )..interceptors.addAll([
          prettyDioLogger,
        ]);

  RetrofitApiDataSourceImpl apiDataSource(Dio dio) => RetrofitApiDataSourceImpl(
        dio,
        baseUrl: FlavorConfig.instance.apiUrl,
      );
}
