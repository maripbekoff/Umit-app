import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/authBloc/bloc.dart';
import 'package:umit/src/blocs/chapterBloc/chapter_bloc.dart';
import 'package:umit/src/blocs/selectedThemeBloc/selected_theme_bloc.dart';
import 'package:umit/src/blocs/smartAdaptationBloc/smart_adaptation_bloc.dart';
import 'package:umit/src/blocs/switchBloc/switch_bloc.dart';
import 'package:umit/src/blocs/themeBloc/bloc.dart';
import 'package:umit/ui/pages/login_page.dart';
import 'package:umit/ui/pages/main_page.dart';
import 'package:umit/ui/pages/navigation/home_page/home_page.dart';
import 'package:umit/ui/pages/splash_screen_page.dart';

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    /// Provides an App to change global settings
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ThemeBloc()),
        BlocProvider(
          create: (BuildContext context) => AuthBloc()..add(AppStartedEvent()),
        ),
        BlocProvider<SwitchBloc>(
          create: (BuildContext context) => SwitchBloc(),
        ),
        BlocProvider<SelectedThemeBloc>(
          create: (BuildContext context) => SelectedThemeBloc(),
        ),
        BlocProvider<SmartAdaptationBloc>(
          create: (BuildContext context) => SmartAdaptationBloc(),
        ),
        BlocProvider<ChapterBloc>(
          create: (BuildContext context) => ChapterBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          if (state is ThemeChangedState)
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              home: App(userRepository: userRepository),
            );
        },
      ),
    );
  }
}

/// Checks is user authorized to system
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
          return MainPage(userRepository: userRepository, user: state.user);
        } else if (state is UnAuthenticatedState) {
          return LoginPageParent(userRepository: userRepository);
        }
      },
    );
  }
}
