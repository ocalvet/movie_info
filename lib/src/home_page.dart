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
            RaisedButton(
              child: Text('Movie List'),
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
