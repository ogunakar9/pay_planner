import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/home/home_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
