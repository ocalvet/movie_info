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
            Text('Home Page'),
            Padding(
              padding: EdgeInsets.only(top: 15.00),
            ),
            RaisedButton(
              child: Text('Show Movies'),
              onPressed: () {
                Navigator.pushNamed(context, '/movies');
              },
            ),
          ],
        ),
      ),
    );
  }
}
