import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zadanko/data/dto/item_dto.dart';

part 'retrofit_api_data_source_impl.g.dart';

@RestApi()
abstract class RetrofitApiDataSourceImpl {
  factory RetrofitApiDataSourceImpl(Dio dio, {String baseUrl}) = _RetrofitApiDataSourceImpl;

  @GET('/ENDPOINT')
  Future<List<ItemDto>> getItems();
}
