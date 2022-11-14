import 'package:flutter/material.dart';
// xD
class Flutterin extends StatelessWidget {
  const Flutterin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox(height: 40),
              Text('Flutterin Injector',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
              Text('Lets inject together.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.normal)),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
