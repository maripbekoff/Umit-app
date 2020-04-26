import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/authBloc/auth_bloc.dart';
import 'package:umit/src/blocs/authBloc/auth_event.dart';
import 'package:umit/src/blocs/authBloc/auth_state.dart';
import 'package:umit/src/is_first_launch.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/main_page.dart';
import 'package:umit/ui/pages/splash_screen_page.dart';
import 'package:umit/ui/pages/welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc()..add(AppStartedEvent()),
        child: App(
          userRepository: userRepository,
        ),
      ),
      theme: ThemeData(
        fontFamily: "Gilroy",
        accentColor: Color(0xFF0097FF),
        scaffoldBackgroundColor: Color(0xFFF7F7F7),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 40,
          ),
        ),
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
