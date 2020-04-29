import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/loginBloc/bloc.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({@required this.userRepository}) {
    this.userRepository = UserRepository();
  }

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      try {
        yield LoginLoadingState();
        var user = await userRepository.signIn(event.email, event.password);
        yield LoginSuccessState(user: user);
      } catch (e) {
        yield LoginFailureState(message: e.toString());
      }
    }
  }
}
