import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/authBloc/auth_bloc.dart';
import 'package:umit/src/blocs/authBloc/auth_event.dart';
import 'package:umit/src/blocs/authBloc/auth_state.dart';
import 'package:umit/src/is_first_launch.dart';
import 'package:umit/ui/pages/home_page.dart';
import 'package:umit/ui/pages/login_page.dart';
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
    );
  }
}

class App extends StatelessWidget {
  UserRepository userRepository;

  App({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text('');
            break;
          default:
            if (!snapshot.hasError) {
              if (snapshot.data.getBool('isFirstLaunch')) {
                saveIsFirstLaunch(false);
                return WelcomePage();
              } else {
                return BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthInitialState) {
                      return SplashScreenPage();
                    } else if (state is AuthenticatedState) {
                      return HomePageParent(
                          user: state.user, userRepository: userRepository);
                    } else if (state is UnAuthenticatedState) {
                      return LoginPageParent(userRepository: userRepository);
                    }
                  },
                );
              }
            }
            break;
        }
      },
    );
  }
}
