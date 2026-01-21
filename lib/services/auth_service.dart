import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/user.dart';
import 'api_service.dart';
import '../core/constants/api_constants.dart';

class AuthService extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _apiService.isAuthenticated;

  Future<void> fetchProfile() async {
    if (!isAuthenticated) return;

    try {
      final response = await _apiService.get('/auth/me');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _user = User.fromJson(data);
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Fetch profile error: $e');
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.post(ApiConstants.login, {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _user = User.fromJson(data['user']);
        await _apiService.setToken(data['token']);
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Login error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(String email, String password, String fullName) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.post(ApiConstants.register, {
        'email': email,
        'password': password,
        'fullName': fullName,
      });

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        _user = User.fromJson(data['user']);
        await _apiService.setToken(data['token']);
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      debugPrint('Register error: $e');
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _user = null;
    await _apiService.clearToken();
    notifyListeners();
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      final response = await _apiService.post(ApiConstants.changePassword, {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      });
      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Change password error: $e');
      return false;
    }
  }

  Future<bool> deleteAccount() async {
    try {
      final response = await _apiService.delete('/auth/delete-account');
      if (response.statusCode == 200) {
        _user = null;
        await _apiService.clearToken();
        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Delete account error: $e');
      return false;
    }
  }
}
