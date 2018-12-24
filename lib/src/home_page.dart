import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieInfo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Playing now'),
              onPressed: () {
                Navigator.pushNamed(context, '/movies');
              },
            ),
            RaisedButton(
              child: Text('Trending'),
              onPressed: () {
                Navigator.pushNamed(context, '/trending');
              },
            ),
          ],
        ),
      ),
    );
  }
}
