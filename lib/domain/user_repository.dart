import '../models/user_json.dart';

abstract class UserRepository {
  Future<UserJson> getUser();
  Future signIn(String email, String password);
  Future<void> updateUser(UserJson user);
  Future<UserJson> sendNotifications();
  Future signUp(String email, String password);
  addUser(UserJson newUser);
  Future<void> signOut();
  Future<void> cancelSubscription();
}