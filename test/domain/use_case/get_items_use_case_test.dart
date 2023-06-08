import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zadanko/domain/entities/item.dart';
import 'package:zadanko/domain/use_case/get_items_use_case.dart';
import 'package:zadanko/domain/utils/failure.dart';

import 'get_items_use_case_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([GetItemsUseCase])
void main() {
  late MockGetItemsUseCase mockGetItemsUseCase;

  final positiveResponse = [const Item(), const Item()];

  setUp(() {
    mockGetItemsUseCase = MockGetItemsUseCase();
  });

  group("getItemsUseCase", () {
    test("Returns right when result is successful", () async {
      when(mockGetItemsUseCase.call()).thenAnswer(
        (_) => Future.value(Right(positiveResponse)),
      );

      final result = await mockGetItemsUseCase.call();

      expect(result.isRight(), true);
    });

    test("Returns left when there is something wrong", () async {
      when(mockGetItemsUseCase.call()).thenAnswer(
        (_) => Future.value(const Left(Failure())),
      );

      final result = await mockGetItemsUseCase.call();

      expect(result.isLeft(), true);
    });
  });
}
