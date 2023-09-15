import 'package:flutter_bloc_clean_arh_project/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  Future<List<UserModel>> getUsers();
}

class AutnRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
  @override
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async {
    // 1. check to make sure that it returns the first data when the response
    // code is 200 or proper response code
    // 2. check to make sure that it "THROW AND CUSTOM EXCEPTION" with the right
    // message when status code is the bad one

    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
