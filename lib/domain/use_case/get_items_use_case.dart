import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zadanko/domain/entities/item.dart';
import 'package:zadanko/domain/repository/api_repository.dart';
import 'package:zadanko/domain/utils/failure.dart';
import 'package:zadanko/domain/utils/use_case.dart';
import 'dart:math';

@injectable
class GetItemsUseCase extends NoParamUseCase<List<Item>> {
  final ApiRepository _apiRepository;

  GetItemsUseCase(this._apiRepository);

  @override
  Future<Either<Failure, List<Item>>> call() async {
    // ! Since I have never encountered an error - I simulated it. There is a 50% chance that the data will not load
    if (Random().nextBool()) {
      return _apiRepository.getItems();
    } else {
      // ! small delay for better error experience :)
      await Future.delayed(const Duration(seconds: 2));
      return const Left(Failure());
    }
  }
}
