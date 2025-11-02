import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../l10n/app_localizations.dart';
import '../providers/theme_provider.dart';
import '../providers/locale_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeModeProvider);
    final currentLocale = ref.watch(localeProvider);
    final loc = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loc?.settings ?? 'Ayarlar'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: SwitchListTile(
              title: Text(
                loc?.darkMode ?? 'Karanlık Mod',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                isDarkMode ? (loc?.on ?? 'Açık') : (loc?.off ?? 'Kapalı'),
              ),
              value: isDarkMode,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).toggleTheme();
              },
              secondary: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(
                    loc?.language ?? 'Dil',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    currentLocale.languageCode == 'tr'
                        ? (loc?.turkish ?? 'Türkçe')
                        : (loc?.english ?? 'English'),
                  ),
                ),
                const Divider(height: 1),
                RadioGroup<String>(
                  groupValue: currentLocale.languageCode,
                  onChanged: (value) {
                    if (value != null) {
                      ref.read(localeProvider.notifier).setLocale(value);
                    }
                  },
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        title: const Text('Türkçe'),
                        value: 'tr',
                      ),
                      RadioListTile<String>(
                        title: const Text('English'),
                        value: 'en',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
