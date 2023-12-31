import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arh_project/core/errors/exceptions.dart';
import 'package:flutter_bloc_clean_arh_project/core/errors/failure.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/data/repositories/authentication_repository_implementation.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/entities/user.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthRemoteDataSrc extends Mock
    implements AuthenticationRemoteDataSource {}

void main() {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthenticationRepositoryImplementation repoIml;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSrc();
    repoIml = AuthenticationRepositoryImplementation(remoteDataSource);
  });

// same message use this const
  const tException = APIException(
    message: 'Unknown Error Occured',
    statusCode: 500,
  );

  group('createUser', () {
    const createdAt = 'whatever.createdAt';
    const name = 'whatever.name';
    const avatar = 'whatever.avatar';
    test(
        'should call the [RemotDataSource.createUser] and complete'
        'successfully when the call to the remote source is successful',
        () async {
      //Arrange
      when(
        () => remoteDataSource.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => Future.value());

      //Act
      final result = await repoIml.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );
      // Assert
      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createUser(
            createdAt: createdAt,
            name: name,
            avatar: avatar,
          ));
    });

    test(
      'should return a [APIFailure] when the call to the remote'
      'source is unsuccessful',
      () async {
        // Arrange
        when(() => remoteDataSource.createUser(
              createdAt: any(named: 'createdAt'),
              name: any(named: 'name'),
              avatar: any(named: 'avatar'),
            )).thenThrow(tException);

        final result = await repoIml.createUser(
          createdAt: createdAt,
          name: name,
          avatar: avatar,
        );

        expect(
          result,
          equals(
            Left(
              APIFailure(
                message: tException.message,
                statusCode: tException.statusCode,
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.createUser(
              createdAt: createdAt,
              name: name,
              avatar: avatar,
            )).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('getUsers', () {
    test(
      'should call the [RemoteDataSource.getUsers] and return [List<User>]'
      'when call to remote source is successful ',
      () async {
        when(() => remoteDataSource.getUsers()).thenAnswer(
          (_) async => [],
        );

        final result = await repoIml.getUsers();

        expect(result, isA<Right<dynamic, List<User>>>());
        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [APIFailure] when the call to the remote'
      'source is unsuccessful',
      () async {
        when(() => remoteDataSource.getUsers()).thenThrow(tException);

        final result = await repoIml.getUsers();

        expect(result, equals(Left(APIFailure.fromException(tException))));
        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
