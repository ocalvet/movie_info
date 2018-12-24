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
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/movies');
              },
              minWidth: double.infinity,
              child:  Text('Playing now'),
              color: Colors.blue,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, '/trending');
              },
              minWidth: double.infinity,
              child:  Text('Trending'),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
