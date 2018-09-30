import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
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
      home: new MyHomePage(title: 'Product list'),
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

class _MyHomePageState extends State<MyHomePage> {
  void _openNewPage(int _index) {

    var detailPage = new Scaffold(
      appBar: new AppBar(title: new Text('商品#$_index' + '明细')),
      body: new Center(
        child: Column(
          children: <Widget>[
            new Image.asset('images/lake.jpg'),
            new Container(
              margin: EdgeInsets.all(8.0),
              child:new Text(
              'The flutter tool uses Google Analytics to anonymously report feature usage statistics and basic crash reports. This data is used to help improve Flutter tools over time. Analytics is not sent on the very first run or for any runs involving flutter config, so you can opt out of analytics before any data is sent. To disable reporting, type flutter config --no-analytics and to display the current setting, type  flutter config. See Google’s privacy policy:www.google.com/intl/en/policies/privacy.',
              overflow:TextOverflow.fade,
              maxLines:7,
              style: TextStyle(
                color:Colors.black,
                fontSize: 16.0,
              ),
            ),
            ),
          ],
        ),
      ),
    );

    setState(() {
      Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return detailPage;
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector _createImage(int _index) {
      return new GestureDetector(
        onTap: () {
          _openNewPage(_index);
        },
        child: new Container(
          child: Image.asset(
            'images/lake.jpg',
          ),
        ),
      );
    }

    var ratings = new Container(
      padding: EdgeInsets.all(8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.green[500]),
              new Icon(Icons.star, color: Colors.black),
              new Icon(Icons.star, color: Colors.black),
            ],
          ),
          new Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );

    var info = Column(
      children: <Widget>[
        new Container(
          padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
          child: new Text(
            'Straberyy Pavlova',
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        new Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          ),
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: new Text(
            'To fix the example in the previous section where the row of 3 images was too wide for its render box, and resulted in the red strip, wrap each widget with an Expanded widget. By default, each widget has a flex factor of 1, assigning one-third of the row to each widget.',
            softWrap: true,
            textAlign: TextAlign.center,
            textDirection: TextDirection.ltr,
          ),
        ),
      ],
    );

    var descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18.0,
      height: 2.0,
    );

    var iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    Column _createItem(int _index) {
      return new Column(
        children: <Widget>[
          _createImage(_index),
          info,
          ratings,
          iconList,
        ],
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent
        child: new ListView(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          shrinkWrap: true,
          children: <Widget>[
            _createItem(0),
            Divider(),
            _createItem(1),
            Divider(),
            _createItem(2),
            Divider(),
            _createItem(3),
          ],
        ),
      ),
    );
  }
}
