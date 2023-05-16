import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:salamtak/features/user_feature/data/model/salamtak_user_model.dart';
import 'package:salamtak/features/user_feature/domain/entity/providers.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  @override
  SalamtakUser get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    final user =
        firebaseUser == null ? SalamtakUser.empty : firebaseUser.toUser;

    return user;
  }

  /// monitor changes in authentication state (log in, log out)
  @override
  // TODO: enable cache
  Stream<SalamtakUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? SalamtakUser.empty : firebaseUser.toUser;

      return user;
    });
  }

  /// monitor changes in user data
  ///
  @override
  Stream<SalamtakUser> get userDataChanges {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .snapshots()
        .map((user) {
      final sUser = user.data() == null
          ? const SalamtakUserModel(id: '')
          : SalamtakUserModel.fromJson(user.data()!);

      return sUser.toEntity();
    });
  }

  /// get all user date from firebase model
  @override
  Future<SalamtakUser> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return SalamtakUser.empty;
    final user = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get();

    final sUser = SalamtakUserModel.fromJson(user.data()!);

    return sUser
        .copyWith(
          email: firebaseUser.email,
          name: firebaseUser.displayName,
          phoneNumber: firebaseUser.phoneNumber,
        )
        .toEntity();
  }

  @override
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  @override
  Future<void> logInAnonymously() async {
    await _firebaseAuth.signInAnonymously();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .set(
          SalamtakUserModel(id: _firebaseAuth.currentUser!.uid).toJson(),
        );
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logInWithGoogle() {
    // TODO: implement logInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpWithEmailAndPassword(
    String email,
    String password,
    SalamtakUserModel user,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser!.updateDisplayName(user.name);
      final id = _firebaseAuth.currentUser!.uid;
      final userModified = user.copyWith(id: id);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .set(userModified.toJson());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logInWithTwitter() async {
    try {
      final twitterProvider = firebase_auth.TwitterAuthProvider();

      if (kIsWeb) {
        await _firebaseAuth.signInWithPopup(twitterProvider);
      } else {
        await _firebaseAuth.signInWithProvider(twitterProvider);
      }
      final id = _firebaseAuth.currentUser!.uid;
      // check if user exists
      final user =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      if (user.data() == null) {
        final userModified = SalamtakUserModel(id: id);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(id)
            .set(userModified.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> changeValue(String key, dynamic value) async {
    try {
      if (key == 'name') {
        await _firebaseAuth.currentUser!.updateDisplayName(value as String);
      }
      if (key == 'email') {
        await _firebaseAuth.currentUser!.updateEmail(value as String);
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({key: value});
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> linkWithEmailAndPassowrd(String email, String password) async {
    try {
      final credential = firebase_auth.EmailAuthProvider.credential(
        email: email,
        password: password,
      );
      await _firebaseAuth.currentUser!.linkWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> linkWithPhoneNumber(String phoneNumber) async {
    try {
      final credential = firebase_auth.PhoneAuthProvider.credential(
        verificationId: '',
        smsCode: '',
      );
      await _firebaseAuth.currentUser!.linkWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProvidersId> getProviders() async {
    try {
      final providers = _firebaseAuth.currentUser?.providerData;
      if (providers == null) return ProvidersId.empty;
      final providerId = providers.map((e) => e.providerId).toList();
      final s = ProvidersId(
        email: providerId.contains(
          firebase_auth.EmailAuthProvider.PROVIDER_ID,
        ),
        google: providerId.contains(
          firebase_auth.GoogleAuthProvider.PROVIDER_ID,
        ),
        twitter: providerId.contains(
          firebase_auth.TwitterAuthProvider.PROVIDER_ID,
        ),
        facebook: providerId.contains(
          firebase_auth.FacebookAuthProvider.PROVIDER_ID,
        ),
        phone: providerId.contains(
          firebase_auth.PhoneAuthProvider.PROVIDER_ID,
        ),
        apple: providerId.contains(
          firebase_auth.AppleAuthProvider.PROVIDER_ID,
        ),
        anonymous: providerId.isEmpty,
      );
      return s;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> linkWithTwitter() async {
    try {
      final twitterProvider = firebase_auth.TwitterAuthProvider();

      if (kIsWeb) {
        await _firebaseAuth.currentUser!.linkWithPopup(twitterProvider);
      } else {
        await _firebaseAuth.currentUser!.linkWithProvider(twitterProvider);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } catch (e) {
      rethrow;
    }
  }

  late firebase_auth.ConfirmationResult confirmationResult;
  late String verificationId;

  @override
  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    if (kIsWeb) {
      confirmationResult = await _firebaseAuth.signInWithPhoneNumber(
        phoneNumber,
      );
    } else {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _firebaseAuth.signInWithCredential(credential);
          final id = _firebaseAuth.currentUser!.uid;
          // check if user exists
          final user = await FirebaseFirestore.instance
              .collection('users')
              .doc(id)
              .get();
          if (user.data() == null) {
            final userModified = SalamtakUserModel(id: id);
            await FirebaseFirestore.instance
                .collection('users')
                .doc(id)
                .set(userModified.toJson());
          }
        },
        verificationFailed: (e) {
          throw e;
        },
        codeSent: (id, token) {
          verificationId = id;
        },
        codeAutoRetrievalTimeout: (id) {
          verificationId = id;
        },
      );
    }
  }

  @override
  Future<void> verifyPhoneNumber(String smsCode) async {
    try {
      if (kIsWeb) {
        await confirmationResult.confirm(smsCode);
      } else {
        final s = firebase_auth.PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );
        await _firebaseAuth.signInWithCredential(
          s,
        );
        final id = _firebaseAuth.currentUser!.uid;
        // check if user exists
        final user =
            await FirebaseFirestore.instance.collection('users').doc(id).get();
        if (user.data() == null) {
          final userModified = SalamtakUserModel(id: id);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(id)
              .set(userModified.toJson());
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}

extension on firebase_auth.User {
  SalamtakUser get toUser {
    return SalamtakUser(
      id: uid,
      email: email,
      name: displayName,
      phoneNumber: phoneNumber,
      photoUrl: photoURL,
    );
  }
}
