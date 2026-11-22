import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../pages/dashboard.dart';
import '../pages/loginPage.dart';
import '../pages/registerPage.dart';

/// Makes GoRouter re-run `redirect` whenever the auth state changes.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh(Stream<User?> stream) {
    _sub = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<User?> _sub;

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

//routes for the app
final GoRouter router = GoRouter(
  initialLocation: '/loginPage',
  refreshListenable: _AuthRefresh(FirebaseAuth.instance.authStateChanges()),
  redirect: (context, state) {
    final loggedIn = FirebaseAuth.instance.currentUser != null;
    final loc = state.matchedLocation;
    final onAuthPage = loc == '/loginPage' || loc == '/registerPage';

    if (!loggedIn && !onAuthPage) return '/loginPage'; // must log in first
    if (loggedIn && onAuthPage) return '/dashboard'; // already logged in
    return null;
  },
  routes: [
    GoRoute(
      path: '/loginPage',
      builder: (context, state) => const loginPage(),
    ),
    GoRoute(
      path: '/registerPage',
      builder: (context, state) => const registerPage(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const dashboard(),
    ),
  ],
);
