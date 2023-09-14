import 'dart:convert';
import 'package:flutter_bloc_clean_arh_project/core/utils/typedef.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/data/models/user_model.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test('should be subclass of [User] entity', () {
    const tModel = UserModel.empty();

    // Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // Arange
      // Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });
}
