import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_clean_arh_project/core/errors/exceptions.dart';
import 'package:flutter_bloc_clean_arh_project/core/errors/failure.dart';
import 'package:flutter_bloc_clean_arh_project/core/utils/typedef.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/entities/user.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDataSource);

  final AuthenticationRemoteDataSource _remoteDataSource;

  @override
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // test-Driven Development
    // call the remote data source
    // check if the method returns the proper data
    // make sure that it returns the proper data if there is no exception
    // check if when the remoteDataSource throws an exception, we return a
    // failure
    try {
      await _remoteDataSource.createUser(
        createdAt: createdAt,
        name: name,
        avatar: avatar,
      );

      return const Right(null);
    } on APIException catch (e) {
      return Left(ApiFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
