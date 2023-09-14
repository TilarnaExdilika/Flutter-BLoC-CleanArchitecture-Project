import 'dart:io';

import 'package:flutter_bloc_clean_arh_project/src/authentication/data/models/user_model.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be subclass of [User] entity', () {
    const tModel = UserModel.empty();

    // Assert
    expect(tModel, isA<User>());
  });

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // Arange
      final tJson = File('test/fixtures/user.json').readAsStringSync();
      print(tJson);
      // Act
      // final result = UserModel.fromMap(map);
    });
  });
}
