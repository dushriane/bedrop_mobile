import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:bedrop_mobile/main.dart';
import 'package:bedrop_mobile/services/auth_service.dart';

void main() {
  group('Bedrop Mobile Tests', () {
    testWidgets('App renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthService()),
          ],
          child: const BedropApp(),
        ),
      );

      // Verify that the app starts with the login screen
      expect(find.text('Bedrop'), findsOneWidget);
      expect(find.text('Welcome back!'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2)); // Email and password fields
    });

    testWidgets('Login form validation works', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthService()),
          ],
          child: const BedropApp(),
        ),
      );

      // Try to login without entering credentials
      final loginButton = find.text('Login');
      await tester.tap(loginButton);
      await tester.pump();

      // Should show validation errors
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('Navigate to signup screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthService()),
          ],
          child: const BedropApp(),
        ),
      );

      // Tap on signup link
      final signupLink = find.text('Sign up');
      await tester.tap(signupLink);
      await tester.pumpAndSettle();

      // Should navigate to signup screen
      expect(find.text('Create your account'), findsOneWidget);
    });
  });

  group('AuthService Tests', () {
    test('Login with valid credentials', () async {
      final authService = AuthService();
      
      final result = await authService.login('user@example.com', 'password123');
      
      expect(result, true);
      expect(authService.isLoggedIn, true);
      expect(authService.currentUser?.email, 'user@example.com');
      expect(authService.isAdmin, false);
    });

    test('Login with admin credentials', () async {
      final authService = AuthService();
      
      final result = await authService.login('admin@example.com', 'password123');
      
      expect(result, true);
      expect(authService.isLoggedIn, true);
      expect(authService.currentUser?.email, 'admin@example.com');
      expect(authService.isAdmin, true);
    });

    test('Login with invalid credentials', () async {
      final authService = AuthService();
      
      final result = await authService.login('', '');
      
      expect(result, false);
      expect(authService.isLoggedIn, false);
      expect(authService.currentUser, null);
    });

    test('Signup with valid information', () async {
      final authService = AuthService();
      
      final result = await authService.signup('John Doe', 'john@example.com', 'password123');
      
      expect(result, true);
      expect(authService.isLoggedIn, true);
      expect(authService.currentUser?.name, 'John Doe');
      expect(authService.currentUser?.email, 'john@example.com');
      expect(authService.isAdmin, false);
    });

    test('Logout functionality', () async {
      final authService = AuthService();
      
      // Login first
      await authService.login('user@example.com', 'password123');
      expect(authService.isLoggedIn, true);
      
      // Then logout
      await authService.logout();
      expect(authService.isLoggedIn, false);
      expect(authService.currentUser, null);
    });
  });
}