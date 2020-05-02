
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/authBloc/bloc.dart';
import 'package:umit/src/blocs/themeBloc/bloc.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/main_page.dart';
import 'package:umit/ui/pages/splash_screen_page.dart';

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          if (state is ThemeChangedState)
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              home: BlocProvider(
                create: (BuildContext context) =>
                    AuthBloc()..add(AppStartedEvent()),
                child: App(userRepository: userRepository),
              ),
            );
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  UserRepository userRepository;

  App({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is AuthInitialState) {
          return SplashScreenPage();
        } else if (state is AuthenticatedState) {
          return MainPage(userRepository: userRepository);
        } else if (state is UnAuthenticatedState) {
          return LoginPageParent(userRepository: userRepository);
        }
      },
    );
  }
}
