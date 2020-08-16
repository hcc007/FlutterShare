import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  Photo({ Key key, this.photo, this.color, this.onTap }) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return new Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: new InkWell(
          onTap: onTap,
          child: new Image.asset(
            photo,
            fit: BoxFit.contain,
          )
      ),
    );
  }
}
