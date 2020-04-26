import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/authBloc/auth_bloc.dart';
import 'package:umit/src/blocs/authBloc/auth_event.dart';
import 'package:umit/src/blocs/authBloc/auth_state.dart';
import 'package:umit/src/blocs/themeBloc/theme_bloc.dart';
import 'package:umit/src/blocs/themeBloc/theme_state.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/main_page.dart';
import 'package:umit/ui/pages/splash_screen_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: AppTheme());
  }
}

class AppTheme extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: App(
          userRepository: userRepository,
        ),
      ),
      theme: state.themeData,
    );
  }
}

class App extends StatelessWidget {
  UserRepository userRepository;

  App({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return SplashScreenPage();
        } else if (state is AuthenticatedState) {
          return MainPage();
        } else if (state is UnAuthenticatedState) {
          return LoginPageParent(userRepository: userRepository);
        }
      },
    );
  }
}
