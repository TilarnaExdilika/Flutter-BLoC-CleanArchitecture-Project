import 'package:flutter_bloc_clean_arh_project/src/authentication/data/models/user_model.dart';
import 'package:flutter_bloc_clean_arh_project/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should be subclass of [User] entity', () {
    // Arrange
    const tModel = UserModel.empty();

    // Act

    // Assert
    expect(tModel, isA<User>());
  });

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      // Arange
    });
  });
}
