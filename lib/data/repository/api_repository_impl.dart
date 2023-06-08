import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zadanko/data/data_source/retrofit_api_data_source_impl.dart';
import 'package:zadanko/data/dto/item_dto.dart';
import 'package:zadanko/domain/entities/item.dart';
import 'package:zadanko/domain/repository/api_repository.dart';
import 'package:zadanko/domain/utils/failure.dart';

@Injectable(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  ApiRepositoryImpl(
    this._retrofitApiDataSource,
  );

  final RetrofitApiDataSourceImpl _retrofitApiDataSource;

  @override
  Future<Either<Failure, List<Item>>> getItems() async {
    try {
      final response = await _retrofitApiDataSource.getItems();
      return Right(response.map((e) => e.toEntity()).toList());
      // ! I haven't noticed any error response
    } on DioError catch (e) {
      // for example error code 400
      if (e.response?.statusCode == 400) {
        final detail = e.response?.data['detail'] as String;
        return Left(Failure(content: detail));
      }
      return Left(Failure(content: e.message));
    } catch (e) {
      // or unknown error
      return Left(Failure(content: e.toString()));
    }
  }
}
