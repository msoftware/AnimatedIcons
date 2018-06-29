import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'AnimatedIcons',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'AnimatedIcons'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _status {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          getAnimatedIcon(AnimatedIcons.add_event, "Event to Add"),
          getAnimatedIcon(AnimatedIcons.arrow_menu, "Menu to Arrow"),
          getAnimatedIcon(AnimatedIcons.close_menu, "Menu to Close "),
          getAnimatedIcon(AnimatedIcons.ellipsis_search, "Search to Ellipsis"),
          getAnimatedIcon(AnimatedIcons.event_add, "Add to Event"),
          getAnimatedIcon(AnimatedIcons.home_menu, "Menu to Home"),
          getAnimatedIcon(AnimatedIcons.list_view, "View to List"),
          getAnimatedIcon(AnimatedIcons.menu_arrow, "Arrow to Menu"),
          getAnimatedIcon(AnimatedIcons.menu_close, "Close to Menu"),
          getAnimatedIcon(AnimatedIcons.menu_home, "Home to Menu"),
          getAnimatedIcon(AnimatedIcons.pause_play, "Play to Pause"),
          getAnimatedIcon(AnimatedIcons.play_pause, "Pause to Play"),
          getAnimatedIcon(AnimatedIcons.search_ellipsis, "Ellipsis to Search"),
          getAnimatedIcon(AnimatedIcons.view_list, "List to View"),
        ],
      ),
    );
  }

  getAnimatedIcon(AnimatedIconData iconData, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            new IconButton(
              onPressed: () {
                _controller.fling(velocity: _status ? -2.0 : 2.0);
              },
              icon: new AnimatedIcon(
                icon: iconData,
                progress: _controller.view,
              ),
            ),
            new Text(title),
          ],
        ),
      ),
    );
  }
}
