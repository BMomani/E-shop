import 'package:e_shop/model/user.dart';
import 'package:e_shop/presentation/views/home_view/bottom_navigation_view.dart';
import 'package:e_shop/presentation/views/on_boarding_view/on_boarding_view.dart';
import 'package:e_shop/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthHomePage extends StatelessWidget {
  const AuthHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? OnBoardingView() : BottomNavigationView();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}