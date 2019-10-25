import 'package:flutter/material.dart';
import 'musique.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music application',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }
}

class _Home extends State<Home> {
  List<Musique> maListeDeMusiques = [
    new Musique("Vagabond 1", "Takeshi Inoue", "images/vagabond2.jpg", "https://codabee.com/wp-content/uploads/2018/06/deux.mp3"),
    new Musique("Vagabond 2", "Takeshi Inoue", "images/vagabond1.jpg", "https://codabee.com/wp-content/uploads/2018/06/un.mp3")
  ];

  Musique maMusiqueActuelle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    maMusiqueActuelle = maListeDeMusiques[0];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Alex Music',
          style: new TextStyle(
            color: Colors.white,
          )
          ),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 10,
      ),
      backgroundColor: Colors.grey[800],
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Card(
              elevation: 9,
              margin: EdgeInsets.only(bottom: 20),
              child: new Container(
                width: MediaQuery.of(context).size.height / 2.5,
                height: MediaQuery.of(context).size.height / 2.5,
                child: new Image.asset(
                  maMusiqueActuelle.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            texteAvecStyle(maMusiqueActuelle.titre, 1.5),
            texteAvecStyle(maMusiqueActuelle.artiste, 1.0),            
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                bouton(Icons.fast_rewind, 30, ActionMusic.rewind),
                bouton(Icons.play_arrow, 45, ActionMusic.play),
                bouton(Icons.fast_forward, 30, ActionMusic.forward),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                texteAvecStyle("0.0", 0.8),
                texteAvecStyle("0:22", 0.8),
              ],
            )
          ],
        ),
      ),
    );
  }

  IconButton bouton(IconData icone, double taille, ActionMusic action) {
    return new IconButton(
      iconSize: taille,
      color: Colors.white,
      icon: new Icon(icone),
      onPressed: () {
        switch (action) {
          case ActionMusic.play:
            print('Play');
            break;
          case ActionMusic.pause:
            print('Pause');
            break;
          case ActionMusic.forward:
            print('Forward');
            break;
          case ActionMusic.rewind:
            print('Rewind');
            break;
        }
      },
    );
  }

  Text texteAvecStyle(String data, double scale) {
    return new Text(
      data,
      textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontStyle: FontStyle.italic
      ),
    );
  }
}

enum ActionMusic {
  play,
  pause,
  rewind,
  forward
}
