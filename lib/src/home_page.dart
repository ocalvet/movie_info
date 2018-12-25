import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MovieInfo'),
        ),
        body: _buildNewLookingBody(context));
  }

  Widget _buildNewLookingBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _button(context, 'Playing Now', '/movies', Colors.orangeAccent),
        ),
        Expanded(
          child: _button(context, 'Trending', '/trending', Colors.tealAccent),
        ),
      ],
    );
  }

  Widget _button(BuildContext context, String label, String route, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'IndieFlower',
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
