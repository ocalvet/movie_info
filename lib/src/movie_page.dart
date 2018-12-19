import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Page'),
      ),
      body: Center(
        child: Text('I guess a movie'),
      ),
    );
  }
}
