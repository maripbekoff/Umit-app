import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_event.dart';
import 'package:umit/src/blocs/homePageBloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepository userRepository;

  HomePageBloc({@required this.userRepository}) {
    this.userRepository = UserRepository();
  }

  @override
  // TODO: implement initialState
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutButtonPressedEvent) {
      await userRepository.signOut();
      yield LogOutSuccess();
    }
  }
}
