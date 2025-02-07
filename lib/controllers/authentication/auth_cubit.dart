import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:equatable/equatable.dart';
import 'package:intellicloud/data/models/use_model.dart';
import 'package:intellicloud/data/repositories/authentication_repo.dart';
import 'package:intellicloud/data/repositories/user_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  final AuthService authService = AuthService();
  final UserProfileService userProfileService = UserProfileService();
  UserProfile? loggedUser;
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final userCredential = await authService.signInWithEmailAndPassword(
        email,
        password,
      );
      loggedUser = await userProfileService.getUserProfile();

      log(loggedUser.toString());

      emit(AuthAuthenticated(userCredential!));
    } on FirebaseAuthException catch (e) {
      log('ERRRRROORRRR');
      emit(AuthError(e.message ?? 'Login failed'));
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(AuthLoading());
    try {
      final userCredential = await authService.signUpWithEmailAndPassword(
        email,
        password,
      );
      await createUserDocument(userCredential, name);
      loggedUser = await userProfileService.getUserProfile();
      emit(AuthAuthenticated(userCredential!));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Registration failed'));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authService.logOut();
      emit(AuthUnauthenticated());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Logout failed'));
    }
  }

  void checkAuthStatus() async {
    emit(AuthLoading());
    final user = authService.currentUser;
    if (user != null) {
      loggedUser = await userProfileService.getUserProfile();
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> createUserDocument(User? user, String name) async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'email': user.email,
        'name': name,
      });
    }
  }
}
