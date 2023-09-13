import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/repositories/authentication_repository.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
    registerFallbackValue(Football());
  });

  const params = CreateUserParams.empty();
  test(
    'should call the [AuthRepo.createUser]',
    () async {
      //Arrange

      // STUB
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => const Right(null));
      //Act
      final result = await usecase(params);
      //Assert
    },
  );
}

class Football {}
