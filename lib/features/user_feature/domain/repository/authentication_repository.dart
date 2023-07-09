import '../../data/model/salamtak_user_model.dart';
import '../entity/salamtak_user.dart';

import '../entity/providers.dart';

abstract class AuthenticationRepository {
  Stream<SalamtakUser> get user;
  Stream<SalamtakUser> get userDataChanges;
  SalamtakUser get currentUser;
  

  Future<void> logInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    SalamtakUserModel user,
  );

  Future<void> logInWithGoogle();

  Future<void> logInWithApple();

  Future<void> logInWithTwitter();

  Future<void> logInAnonymously();

  Future<void> logOut();

  Future<bool> isSignedIn();
  Future<SalamtakUser> getUser();

  Future<void> changeValue(String key, dynamic value);

  // TODO(2): implement this in profile page
  Future<void> linkWithEmailAndPassowrd(String email, String password);

  Future<void> linkWithTwitter();

  // TODO(3): implement this in profile page
  Future<void> linkWithPhoneNumber(String phoneNumber);

  Future<ProvidersId> getProviders();

  //! TODO(4): not work, need bug fix
  Future<void> deleteAccount();

  Future<void> loginWithPhoneNumber(String phoneNumber);

  Future<void> verifyPhoneNumber(String smsCode);
}
