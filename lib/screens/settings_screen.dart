import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import '../services/language_service.dart';
import '../core/constants/app_strings.dart';
import 'auth/change_password_screen.dart';
import 'auth/login_screen.dart';
import '../services/auth_service.dart';
import 'health_disclaimer_screen.dart';
import 'privacy_policy_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(AppStrings.get(context, 'language')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Türkçe'),
                  leading: Radio<String>(
                    value: 'tr',
                    groupValue:
                        context.read<LanguageService>().locale.languageCode,
                    onChanged: (val) {
                      context.read<LanguageService>().setLanguage(val!);
                      Navigator.pop(context);
                    },
                  ),
                  onTap: () {
                    context.read<LanguageService>().setLanguage('tr');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('English'),
                  leading: Radio<String>(
                    value: 'en',
                    groupValue:
                        context.read<LanguageService>().locale.languageCode,
                    onChanged: (val) {
                      context.read<LanguageService>().setLanguage(val!);
                      Navigator.pop(context);
                    },
                  ),
                  onTap: () {
                    context.read<LanguageService>().setLanguage('en');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _confirmDeleteAccount() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              AppStrings.get(context, 'delete_account'),
              style: const TextStyle(color: Colors.red),
            ),
            content: Text(AppStrings.get(context, 'delete_account_warning')),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(AppStrings.get(context, 'cancel')),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final success =
                      await context.read<AuthService>().deleteAccount();
                  if (mounted) {
                    Navigator.pop(context); // Close dialog
                    if (success) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account deleted successfully.'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to delete account.'),
                        ),
                      );
                    }
                  }
                },
                child: Text(AppStrings.get(context, 'ok')),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeService = context.watch<ThemeService>();
    final isDark =
        themeService.themeMode == ThemeMode.dark ||
        (themeService.themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.get(context, 'settings')),
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text(
            AppStrings.get(context, 'account_settings'),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: Text(AppStrings.get(context, 'change_password')),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.red),
            title: Text(
              AppStrings.get(context, 'delete_account'),
              style: const TextStyle(color: Colors.red),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.red),
            onTap: _confirmDeleteAccount,
          ),
          const Divider(height: 32),
          Text(
            AppStrings.get(context, 'app_settings'),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: Text(AppStrings.get(context, 'dark_mode')),
            subtitle: Text(AppStrings.get(context, 'enable_dark_theme')),
            value: isDark,
            onChanged: (val) {
              themeService.toggleTheme(val);
            },
            secondary: const Icon(Icons.dark_mode_outlined),
          ),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(AppStrings.get(context, 'language')),
            subtitle: Text(AppStrings.get(context, 'select_language')),
            trailing: const Icon(Icons.chevron_right),
            onTap: _showLanguageDialog,
          ),

          const Divider(height: 32),
          Text(
            AppStrings.get(context, 'help_support'),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(AppStrings.get(context, 'health_disclaimer_title')),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const HealthDisclaimerScreen(initial: false),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(AppStrings.get(context, 'privacy_policy')),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
              );
            },
          ),

          const SizedBox(height: 48),
        ],
      ),
    );
  }
}
