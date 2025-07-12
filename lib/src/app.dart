import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'routing/app_router.dart';
import 'package:go_router/go_router.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'features/home/home_view.dart';

// Placeholder for Subscriptions tab
class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Subscriptions'));
  }
}

// Placeholder for Analysis tab
class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Analysis'));
  }
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Pay Planner',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: settingsController.themeMode,
          routerConfig: createRouter(settingsController),
        );
      },
    );
  }
}
