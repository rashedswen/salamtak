import 'package:salamtak/features/user_feature/data/model/salamtak_user_model.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';

abstract class AuthenticationRepository {
  Stream<SalamtakUser> get user;
  SalamtakUser get currentUser;

  Future<void> logInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    SalamtakUserModel user,
  );

  Future<void> logInWithGoogle();

  Future<void> logInWithTwitter();

  Future<void> logInAnonymously();

  Future<void> logOut();

  Future<bool> isSignedIn();
  Future<SalamtakUser> getUser();

  Future<void> changeValue(String key, dynamic value);
}
