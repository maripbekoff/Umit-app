import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/logOutBloc/bloc.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  UserRepository userRepository;

  LogOutBloc({@required this.userRepository}) {
    this.userRepository = UserRepository();
  }

  @override
  LogOutState get initialState => LogOutInitial();

  @override
  Stream<LogOutState> mapEventToState(LogOutEvent event) async* {
    if (event is LogOutButtonPressedEvent) {
      await userRepository.signOut();
      yield LogOutSuccess();
    }
  }
}
