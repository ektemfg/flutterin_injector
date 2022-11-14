import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Injector extends StatefulWidget {
  const Injector({Key? key}) : super(key: key);

  @override
  State<Injector> createState() => _InjectorState();
}

class _InjectorState extends State<Injector> {
  int injectionCounter = 0;
  double flutterinAmount = 0;
  String? message;
  int roundNumber = 0;
  Color? bgColor = Color.fromRGBO(250, 250, 250, 1);
  Timer? timer;
  List<String> imageUrls = [
    'https://media.tenor.com/aJkVezBRcFEAAAAC/najmi.gif',
    'https://media.tenor.com/y3xMe7GyVy0AAAAi/peepo-nerd-glasses.gif',
    'https://media.tenor.com/hxJXRJScdBsAAAAC/what-blink.gif',
    'https://media.tenor.com/BpCriX2YZTsAAAAd/dance-crazy.gif',
    'https://media.tenor.com/pOfUpPxwgHEAAAAC/is-it.gif',
    'https://media.tenor.com/RbGYsv2FXBUAAAAC/holandia-cpun.gif',
    'https://media.tenor.com/q4gwe9md2XAAAAAC/spongebob-rainbow.gif',
    'https://media.tenor.com/ApxBu1krFnIAAAAC/shaking-twitch.gif',
    'https://media.tenor.com/qh0sW8TY_rsAAAAC/stop-it-get-some-help.gif',
    'https://media.tenor.com/89A1A8BhUyMAAAAd/oldmansethus-trainspotting.gif',
    'https://media.tenor.com/s3ic4I-nkS8AAAAd/oldmansethus.gif',
    'https://media.tenor.com/72UTHAJ2RSYAAAAC/cookie-dough.gif',
    'https://media.tenor.com/Ut1EdX0r6soAAAAC/code-monkey-checkmate-digital.gif',
    'https://media.tenor.com/Ev_Zlnn-niMAAAAC/horse-developer.gif'
  ];

  String randomGif(List<String> list) {
    var randomUrl = (list.toList()..shuffle()).first;
    return randomUrl;
  }

  void changeColor() {
    setState(() {
      var random = Random();
      bgColor = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  void resetGame() {
    setState(() {
      injectionCounter = 0;
      flutterinAmount = 0;
      message = null;
      bgColor = Color.fromRGBO(250, 250, 250, 1);
      roundNumber++;
    });
  }

  void countInjections() {
    setState(() {
      if (injectionCounter < 10) {
        injectionCounter++;
        flutterinAmount += 0.2;
        if (injectionCounter > 6) {
          changeColor();
        }
      } else {
        injectionCounter = 0;
        flutterinAmount = 0;
        timer = Timer.periodic(Duration(milliseconds: 40), (Timer t) {
          changeColor();
        });
        message = "That is enough Flutterin for today";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        children: [
          if (message == null) ...[
            SizedBox(height: 10),
            Image.network('${randomGif(imageUrls)}', width: 200, height: 200),
            Text(
              roundNumber == 0
                  ? 'You have injected'
                  : "I told you THAT YOU OVERDOSED",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '$injectionCounter times',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              roundNumber == 0
                  ? 'Flutterin amount in your blood:'
                  : "Now both you and me are f*****",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${flutterinAmount.toStringAsFixed(2)} grams',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            FloatingActionButton(
                child: Text(
                  "Inject",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: countInjections)
          ] else
            Column(
              children: [
                Text(
                    roundNumber == 0
                        ? message ?? ""
                        : "PLEASE DONT INJECT MORE",
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                    roundNumber == 0
                        ? "You have overdosed and cant take more flutterin."
                        : "I dont feel very good",
                    style: Theme.of(context).textTheme.bodyMedium),
                Image.network(
                    roundNumber == 0
                        ? "https://media.tenor.com/bmL21Em6rzsAAAAC/ha-ha-point.gif"
                        : "https://media.tenor.com/U5QXJDAXq_AAAAAi/erro.gif",
                    width: 200,
                    height: 200),
                FloatingActionButton(
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: resetGame)
              ],
            )
        ],
      ),
    );
  }
}
