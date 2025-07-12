import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/home/home_view.dart';
import '../sample_feature/sample_item_list_view.dart';
import '../sample_feature/sample_item_details_view.dart';
import '../settings/settings_view.dart';
import '../settings/settings_controller.dart';

// Placeholders for Subscriptions and Analysis
class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('Subscriptions'));
}

class AnalysisView extends StatelessWidget {
  const AnalysisView({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Analysis'));
}

// MainTabScaffold for ShellRoute
class MainTabScaffold extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final void Function(int) onTabSelected;
  const MainTabScaffold({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onTabSelected,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabSelected,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt), label: 'Payments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics), label: 'Analysis'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

GoRouter createRouter(SettingsController settingsController) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final location = state.uri.toString();
          int currentIndex = 0;
          if (location.startsWith('/payments'))
            currentIndex = 1;
          else if (location.startsWith('/subscriptions'))
            currentIndex = 2;
          else if (location.startsWith('/analysis'))
            currentIndex = 3;
          else if (location.startsWith('/settings')) currentIndex = 4;
          void onTabSelected(int idx) {
            switch (idx) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/payments');
                break;
              case 2:
                context.go('/subscriptions');
                break;
              case 3:
                context.go('/analysis');
                break;
              case 4:
                context.go('/settings');
                break;
            }
          }

          return MainTabScaffold(
            currentIndex: currentIndex,
            onTabSelected: onTabSelected,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: HomeView()),
          ),
          GoRoute(
            path: '/payments',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SampleItemListView()),
            routes: [
              GoRoute(
                path: 'detail',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: SampleItemDetailsView()),
              ),
            ],
          ),
          GoRoute(
            path: '/subscriptions',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SubscriptionsView()),
          ),
          GoRoute(
            path: '/analysis',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: AnalysisView()),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => NoTransitionPage(
                child: SettingsView(controller: settingsController)),
          ),
        ],
      ),
    ],
  );
}
