import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';

abstract class AuthenticationRepository {
  Stream<User> get user;
  Future<void> logInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> logInWithGoogle();

  Future<void> logOut();
  Future<bool> isSignedIn();
  Future<String> getUser();
}
