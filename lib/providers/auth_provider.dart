import 'package:flutter/material.dart';
import '../services/firebase_auth_service.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuthService _authService;

  AuthProvider(this._authService) {
    _authService.addListener(notifyListeners);
  }

  UserModel? get user => _authService.userModel;
  bool get isLoading => _authService.isLoading;
  bool get isAuthenticated => user != null;

  Future<String?> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  Future<String?> register(
    String email,
    String password,
    String fullName,
  ) async {
    return await _authService.register(email, password, fullName);
  }

  Future<void> logout() async {
    await _authService.logout();
  }

  Future<String?> resetPassword(String email) async {
    return await _authService.resetPassword(email);
  }

  Future<String?> changePassword(
    String currentPassword,
    String newPassword,
  ) async {
    return await _authService.changePassword(currentPassword, newPassword);
  }

  Future<String?> deleteAccount() async {
    return await _authService.deleteAccount();
  }

  @override
  void dispose() {
    _authService.removeListener(notifyListeners);
    super.dispose();
  }
}
