import "package:flutter/material.dart";
import "package:routing/Navigation_named.dart";


//void main() => runApp(MyApp());
void main() => runApp(MyNavigationNameRouteApp());




class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Routing",
      home: MyMainScreen(),
    );
  }
}


class MyMainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: GestureDetector(
        child: Hero(
          tag: "imageHero",
          child: Image.network("https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg"),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return DetailScreen();
          }));
        },
      ),
    );
  }
}


class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: "imageHero",
            child: Image.network("https://raw.githubusercontent.com/flutter/website/master/src/_includes/code/layout/lakes/images/lake.jpg"),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}