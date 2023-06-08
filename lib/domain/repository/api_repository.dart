import 'package:dartz/dartz.dart';
import 'package:zadanko/domain/entities/item.dart';

import '../utils/failure.dart';

abstract class ApiRepository {
  Future<Either<Failure, List<Item>>> getItems();
}
