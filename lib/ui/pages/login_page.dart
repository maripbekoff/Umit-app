import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/loginBloc/login_bloc.dart';
import 'package:umit/src/blocs/loginBloc/login_event.dart';
import 'package:umit/src/blocs/loginBloc/login_state.dart';
import 'package:umit/ui/pages/main_page.dart';

class LoginPageParent extends StatelessWidget {
  UserRepository userRepository;

  LoginPageParent({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: userRepository),
      child: LogInPage(userRepository: userRepository),
    );
  }
}

class LogInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginBloc loginBloc;
  UserRepository userRepository;
  Size size;

  LogInPage({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/login_page/background.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              Container(
                padding: EdgeInsets.all(5.0),
                child: BlocListener<LoginBloc, LoginState>(
                  listener: (BuildContext context, LoginState state) {
                    if (state is LoginSuccessState) {
                      navigateToHomeScreen(context, state.user);
                    }
                    if (state is LoginFailureState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Не правильный логин или пароль')),
                      );
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (BuildContext context, LoginState state) {
                      if (state is LoginInitialState) {
                        return buildInitialUi();
                      } else if (state is LoginLoadingState) {
                        return buildLoadingUi();
                      } else if (state is LoginFailureState) {
                        return buildFailureUi(context, state.message);
                      } else if (state is LoginSuccessState) {
                        emailController.text = "";
                        passwordController.text = "";
                        return Container();
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 5),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    errorStyle: TextStyle(color: Color(0xFFC4C4C4)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "E-mail",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.1, vertical: 5),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 40,
                    ),
                    errorStyle: TextStyle(color: Color(0xFFC4C4C4)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: "Пароль",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: OutlineButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 60,
                      ),
                      shape: StadiumBorder(),
                      borderSide: BorderSide(color: Colors.white),
                      highlightedBorderColor: Colors.white,
                      color: Colors.transparent,
                      child: Text(
                        "Войти",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      onPressed: () {
                        loginBloc.add(
                          LoginButtonPressedEvent(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInitialUi() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        "Вход в систему",
        style: TextStyle(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildFailureUi(BuildContext context, String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildInitialUi(),
      ],
    );
  }

  void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return MainPage(userRepository: userRepository);
    }));
  }
}
