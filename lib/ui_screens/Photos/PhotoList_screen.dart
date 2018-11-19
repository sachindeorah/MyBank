import 'package:flutter/material.dart';
import 'package:mybank/model/Photo.dart';
import 'package:mybank/model/album.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PhotoList_screen extends StatefulWidget{
 final Album album;

 PhotoList_screen({Key key,@required this.album}):super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PhotoList_screenState();
  }
}

class PhotoList_screenState extends State<PhotoList_screen>{

  StreamController<Photo> streamController;
  List<Photo> list =[];
@override
  void initState(){
  super.initState();
  streamController = StreamController.broadcast();
  streamController.stream.listen((p) =>
   setState(() => list.add(p)
   ));

  load(streamController);
}

load (StreamController sc) async {
  String url = "https://jsonplaceholder.typicode.com/albums/" + widget.album.id.toString()+ "/photos";
  var client = new http.Client();

  var req = new http.Request('get',Uri.parse(url));

  var streamRes = await client.send(req);

  streamRes.stream
  .transform(utf8.decoder)
  .transform(json.decoder)
  .expand((e) =>e)
  .map((map)=> Photo.fromJsonMap(map))
  .pipe(streamController);
}

@override
  void dispose(){
  super.dispose();
  streamController?.close();
  streamController = null;
}

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Streams for album " + widget.album.id.toString()),
      ),
      body: Center(
        child: ListView.builder(

            itemBuilder: (BuildContext context, int index) => _makeElement(index),
        ),
      ),
    );
  }

  Widget _makeElement(int index){
  if (index > list.length){
    return null;
  }

  return Container(
    padding: EdgeInsets.all(5.0),
    child:Container(
      child: Column(
        children: <Widget>[
          Image.network(list[index].thumburl),
          Text(list[index].title, textScaleFactor: 1.0,),
        ],
      ),
    )
  );
  }
}