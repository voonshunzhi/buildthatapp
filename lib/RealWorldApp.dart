import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'VideoCell.dart';
import 'DetailPage.dart';

class RealWorldApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RealWorldAppState();
  }
}

class RealWorldAppState extends State<RealWorldApp> {
  bool _isLoading = true;
  List<dynamic> _videos;

  Future<Map<String, dynamic>> _fetchData() async {
    Map<String, dynamic> videos;

    print("Getting data from API");

    final jsonData =
        await http.get("https://api.letsbuildthatapp.com/youtube/home_feed");

    if (jsonData.statusCode == 200) {
      videos = convert.json.decode(jsonData.body);
    }

    return videos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("REAL WORLD APP"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              _fetchData().then((vids) {
                setState(() {
                  _videos = vids["videos"];
                  _isLoading = false;
                });
              });
            },
          )
        ],
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: this._videos.length,
                itemBuilder: (BuildContext context, int index) {
                  var video = this._videos[index];
                  return FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: VideoCell(
                        video: video,
                      ),
                      onPressed: () {
                        print("Video cell tapped $index");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailPage();
                        }));
                      });
                },
              ),
      ),
    ));
  }
}
