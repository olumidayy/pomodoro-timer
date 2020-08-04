import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:circular_countdown/circular_countdown.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECX Internship',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int time;
  var unit;


  @override
  void initState(){
    super.initState();
    unit = CountdownUnit.second;
    time = 1;
  }

  @override
  void dispose(){
    super.dispose();
    unit = CountdownUnit.second;
  }

  @override
  Widget build(BuildContext context) {
    final player = new AudioCache();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro'),
        backgroundColor: Colors.black,
        elevation: 4,
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TimeCircularCountdown(
              unit: unit,
              countdownTotal: time,
              diameter: 300,
              countdownCurrentColor: Colors.amber,
              onFinished: () {
                player.play('bell.wav');
              },
              onUpdated: (unit, remainingTime) {
                setState(() {});
              },
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 90,
              ),
            ),
            Container(
              height: 40,
              child: RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('Begin Session'),
                  onPressed: () {
                    setState(() {
                      unit = CountdownUnit.minute;
                      time = 25;
                      player.play('bell.wav');
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 40,
                  child: RaisedButton(
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Long Break'),
                      onPressed: () {
                        setState(() {
                          unit = CountdownUnit.minute;
                          time = 10;
                          player.play('bell.wav');
                        });
                      }),
                ),
                Container(
                  height: 40,
                  child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Short Break'),
                      onPressed: () {
                        setState(() {
                          time = 5;
                          player.play('bell.wav');
                        });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
