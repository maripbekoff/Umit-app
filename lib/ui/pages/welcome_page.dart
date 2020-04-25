import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:umit/repositories/user_repository.dart';
import 'package:umit/ui/pages/login_page.dart';

class WelcomePage extends StatefulWidget {
  UserRepository userRepository = UserRepository();

  @override
  _WelcomePageState createState() =>
      _WelcomePageState(userRepository: userRepository);
}

class _WelcomePageState extends State<WelcomePage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  UserRepository userRepository;

  _WelcomePageState({@required this.userRepository});

  Widget _buildImage(String assetName) {
    return Image.asset(
      'assets/img/welcome_page/$assetName.png',
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      contentPadding: EdgeInsets.only(top: 20),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Кто мы?",
          body:
              "Úmit - это первая адаптированная система обучения под особые потребности. Теперь образование стало более доступной и качественной. Úmit даст возможность получения образование слепым, невзрячим и даже тем, у кого есть нарушение опорно-двигательного аппрата.",
          image: _buildImage('Nick Vuychich'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Я буду проходить курсы?",
          body:
              "Úmit - это не площадка набитая курсами. Это целая система, которая упрощает и цифровизирует процессы обучения студентов и школьников, упрощает процесс заполнения расписания уроков, даёт преподавателям возможность видеть всю статистику по классам, а администрации статистику по персоналу.",
          image: _buildImage('Steven Hocking'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Делаем мир лучше",
          body:
              "Теперь любой желающий получить хорошее образование, несмотря на, возможные отклонения, способен обучаться с остальными. Мы делаем их жизнь намного проще и улучшаем её. Давайте делать добро!",
          image: _buildImage('Kids with disabilities'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  LoginPageParent(userRepository: userRepository))),
      // TODO: Make a setup an app, when it firstly launched
      // onSkip: () => PreliminarilySetup(),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Пропустить'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Завершить',
          style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
