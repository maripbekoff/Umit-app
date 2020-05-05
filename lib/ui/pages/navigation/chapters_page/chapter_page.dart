import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:umit/src/blocs/chapterBloc/chapter_bloc.dart';
import 'package:umit/src/global/text_style.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ChapterPage extends StatelessWidget {
  var snapshot;
  Size _size;
  int _nextPage = 1;
  String _videoId;
  ChapterBloc _chapterBloc;
  YoutubePlayerController _controller;
  PageController _pageController = PageController();
  List<Widget> _bottomActions = [
    CurrentPosition(),
    ProgressBar(isExpanded: true),
    RemainingDuration(),
    FullScreenButton(),
  ];

  ChapterPage({Key key, @required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _chapterBloc = BlocProvider.of<ChapterBloc>(context);
    snapshot = snapshot["blocks"];
    _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Назад'),
          titleSpacing: 0,
          textTheme: TextTheme(title: appBarTextStyle),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: BlocListener<ChapterBloc, ChapterState>(
                listener: (BuildContext context, ChapterState state) {
                  if (state is ChapterInitial)
                    _nextPage = 1 + state.currentPage;
                },
                child: BlocBuilder<ChapterBloc, ChapterState>(
                  builder: (BuildContext context, ChapterState state) {
                    if (state is ChapterInitial) {
                      return buildCurrentChapterPage(state.currentPage);
                    } else if (state is ChapterInitial) {
                      return buildInitialChapterPage();
                    }
                  },
                ),
              ),
            ),
            Flexible(
              child: PageView.builder(
                itemCount: snapshot.length,
                controller: _pageController,
                onPageChanged: (int index) {
                  _chapterBloc.add(ChapterSlidedPage(currentPage: index + 1));
                },
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot[index]["type"] == 'youtube') {
                    _videoId = YoutubePlayer.convertUrlToId(
                        '${snapshot[index]["content"]}');
                    _controller = YoutubePlayerController(
                      initialVideoId: _videoId,
                      flags: YoutubePlayerFlags(
                        autoPlay: false,
                        captionLanguage: 'ru',
                      ),
                    );
                  }

                  return ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    children: <Widget>[
                      Text('${snapshot[index]["name"]}', style: titleTextStyle),
                      SizedBox(height: 30),
                      snapshot[index]["type"] == 'html'
                          ? Html(data: snapshot[index]["content"])
                          : Offstage(),
                      snapshot[index]["type"] == 'youtube'
                          ? YoutubePlayer(
                              showVideoProgressIndicator: true,
                              bottomActions: _bottomActions,
                              controller: _controller,
                            )
                          : Offstage(),
                      snapshot[index]["comment"] != null
                          ? ExpansionTile(
                              title: Text('Комментарий'),
                              children: <Widget>[
                                Text('${snapshot[index]["comment"]}')
                              ],
                            )
                          : Offstage(),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CupertinoButton(
                color: Color(0xFF0097FF),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: _size.width / 4,
                ),
                child: Text(
                  'Далее',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => slideToNextPage(_nextPage),
              ),
            )
          ],
        ),
      ),
    );
  }

  void slideToNextPage(int nextPage) {
    _pageController.animateToPage(nextPage,
        duration: Duration(seconds: 1), curve: Curves.fastLinearToSlowEaseIn);
  }

  Widget buildInitialChapterPage() {
    return Text(
      '1/${snapshot.length}',
      style: defaultBoldTextStyle,
    );
  }

  Widget buildCurrentChapterPage(int currentPage) {
    return Text(
      '$currentPage/${snapshot.length}',
      style: defaultBoldTextStyle,
    );
  }
}
