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

  Future<void> logInWithTwitter();

  Future<void> logInAnonymously();

  Future<void> logOut();

  Future<bool> isSignedIn();
  Future<SalamtakUser> getUser();

  Future<void> changeValue(String key, dynamic value);

  Future<void> linkWithEmailAndPassowrd(String email, String password);

  Future<void> linkWithTwitter();

  Future<void> linkWithPhoneNumber(String phoneNumber);

  Future<ProvidersId> getProviders();

  Future<void> deleteAccount();
}
