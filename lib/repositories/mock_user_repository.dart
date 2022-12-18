import 'package:flutterdemo/models/cart_json.dart';
import 'package:flutterdemo/models/user_json.dart';
import 'package:flutterdemo/models/wishlist_json.dart';

import '../domain/user_repository.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<UserJson> getUser() async {
    return UserJson(email: 'tuba@gmail.com', firstName: 'Tuba', lastName: 'N', contact: '0222222222', cart: [CartItemJson(productId: 'E2rK89SjLpzbLWgBxbiB', quantity: 2)], wishlist: [WishlistItemJson(productId:'E2rK89SjLpzbLWgBxbiB')], notifications: []);
  }

  @override
  Future signIn(String email, String password) {
    return Future.value('2313');
  }

  @override
  Future<UserJson> sendNotifications() {
    // TODO: implement sendNotifications
    return Future.value(UserJson(email: 'tuba@gmail.com', firstName: 'Tuba', lastName: 'N', contact: '0222222222', cart: [CartItemJson(productId: 'E2rK89SjLpzbLWgBxbiB', quantity: 2)], wishlist: [WishlistItemJson(productId:'E2rK89SjLpzbLWgBxbiB')], notifications: []));
  }

  @override
  addUser(UserJson newUser) {
    // TODO: implement addUser
    throw UnimplementedError();
  }



  @override
  Future<void> setUser(String? id) {
    // TODO: implement setUser
    throw UnimplementedError();
  }

  @override
  Future signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserJson user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
