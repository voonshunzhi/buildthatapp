import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class VideoCell extends StatelessWidget {
  final video;

  VideoCell({this.video});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                image: video["imageUrl"],
                placeholder: kTransparentImage,
              ),
              Text(
                video["name"],
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
    ;
  }
}
