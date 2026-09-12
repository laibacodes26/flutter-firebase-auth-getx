import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  final AuthService _authService=AuthService();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  final isConfirmPasswordVisible = false.obs;
  final Rxn<UserModel> currentUser = Rxn<UserModel>();

  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;
    if (email.isEmpty) return _error('Please enter your email');
    if (!GetUtils.isEmail(email)) return _error('Please enter a valid email');
    if (password.isEmpty) return _error('Please enter your password');
    try {
      isLoading.value = true;
      final user=await _authService.login(email:email,password:password);
      currentUser.value = user;
      _success('Login successful');
      passwordController.clear();
      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      _error(_authService.mapError(e));
    } catch (e) {
      _error('Something went wrong. Please try again');
    } finally { isLoading.value = false; }
  }

  Future<void> signup() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text;
    final confirm = confirmPasswordController.text;
    if (name.isEmpty) return _error('Please enter your name');
    if (email.isEmpty) return _error('Please enter your email');
    if (!GetUtils.isEmail(email)) return _error('Please enter a valid email');
    if (password.isEmpty) return _error('Please enter your password');
    if (password.length < 6) return _error('Password must be at least 6 characters');
    if (confirm.isEmpty) return _error('Please confirm your password');
    if (password != confirm) return _error('Passwords do not match');
    try {
      isLoading.value = true;
      await _authService.signUp(name:name,email:email,password:password);
      _success('Account created successfully');
      nameController.clear(); emailController.clear();
      passwordController.clear(); confirmPasswordController.clear();
      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      _error(_authService.mapError(e));
    } catch (e) {
      _error('Something went wrong. Please try again');
    } finally { isLoading.value = false; }
  }

  Future<void> logout() async {
    await _authService.logout();
    currentUser.value = null;
    emailController.clear(); passwordController.clear();
    Get.offAllNamed(AppRoutes.login);
    Get.snackbar('Logged out','You have been logged out successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF252033), colorText: Colors.white,
      margin: const EdgeInsets.all(16), borderRadius: 14,
      duration: const Duration(seconds: 2));
  }

  void _success(String message) {
    Get.snackbar('Success',message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF19B86B), colorText: Colors.white,
      margin: const EdgeInsets.all(16), borderRadius: 14,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.check_circle,color: Colors.white));
  }

  void _error(String message) {
    Get.snackbar('Error',message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFFD92D45), colorText: Colors.white,
      margin: const EdgeInsets.all(16), borderRadius: 14,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error_outline,color: Colors.white));
  }

  @override
  void onClose() {
    nameController.dispose(); emailController.dispose();
    passwordController.dispose(); confirmPasswordController.dispose();
    super.onClose();
  }
}