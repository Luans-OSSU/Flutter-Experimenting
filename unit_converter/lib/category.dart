
import "package:flutter/material.dart";


class Category extends StatelessWidget {

  final _rowHeight = 100.0;
  final _borderRadius = 60.0;
  final name;
  final icon;
  final loc;

  const Category(this.name, this.icon, this.loc);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          customBorder: _borderRadius,
          highlightColor: Colors.green,
          splashColor: Colors.green,
          onTap: () => print("I was tapped!"),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: loc != null ? Icon(Icons.cake) : icon,
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                  )
                )
              ],
            ),
          ),
        )
      )
    )
  }
}