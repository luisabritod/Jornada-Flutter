import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/features/auth/auth.dart';
import 'package:social_app/features/auth/services/services.dart';

class AuthController extends GetxController {
  final AuthService _service = Get.find<AuthService>();

  var isLoading = false.obs;
  var user = Rx<UserModel?>(null);

  Future<void> signUp(String name, String email, String password) async {
    try {
      isLoading.value = true;

      final firebaseUser = await _service.signUpWithEmailAndPassword(
        email,
        password,
      );

      if (firebaseUser != null) {
        final appUser = UserModel(
          id: firebaseUser.uid,
          name: name,
          email: firebaseUser.email!,
          profilePictureUrl: firebaseUser.photoURL,
        );
        user.value = appUser;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
