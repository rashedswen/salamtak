import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:salamtak/features/user_feature/data/model/salamtak_user_model.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  final firebase_auth.FirebaseAuth _firebaseAuth;
  @override
  // TODO: enable cache
  SalamtakUser get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    final user =
        firebaseUser == null ? SalamtakUser.empty : firebaseUser.toUser;

    return user;
  }

  @override
  // TODO: enable cache
  Stream<SalamtakUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? SalamtakUser.empty : firebaseUser.toUser;

      return user;
    });
  }

  @override
  Future<SalamtakUser> getUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    final user = await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .get();

    final sUser = user.data() == null
        ? const SalamtakUserModel(id: '')
        : SalamtakUserModel.fromJson(user.data()!);

    return sUser.toEntity();
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
      final twitterProvider = TwitterAuthProvider();

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
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update({key: value});
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
    );
  }
}
