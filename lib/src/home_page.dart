import 'package:flutter/material.dart';
import 'package:movie_info/src/map_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovInfo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return MapPage();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: _buildBody(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'MovInfo',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.amberAccent,
              ),
            ),
            ListTile(
              title: Text('Upcoming movies'),
              subtitle: Text('movies will be playing in the theaters'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/upcoming');
              },
            ),
            ListTile(
              title: Text('Playing now'),
              subtitle: Text('movies are playing in the theaters now'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/movies');
              },
            ),
            ListTile(
              title: Text('Trending'),
              subtitle: Text('movies that people are currently reviewing'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/trending');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _button(
              context, 'Upcoming', '/upcoming', Colors.lightGreenAccent),
        ),
        Expanded(
          child:
              _button(context, 'Playing Now', '/movies', Colors.orangeAccent),
        ),
        Expanded(
          child: _button(context, 'Trending', '/trending', Colors.tealAccent),
        ),
      ],
    );
  }

  Widget _button(
      BuildContext context, String label, String route, Color color) {
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
