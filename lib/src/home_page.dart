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
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/movies');
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                child: Text(
                  'Playing Now',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'IndieFlower',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/trending');
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              child: Center(
                child: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'IndieFlower',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/movies');
            },
            minWidth: double.infinity,
            child: Text('Playing now'),
            color: Colors.blue,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/trending');
            },
            minWidth: double.infinity,
            child: Text('Trending'),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
