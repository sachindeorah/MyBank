import 'package:flutter/material.dart';
import 'package:mybank/model/album.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mybank/ui_screens/Photos/PhotoList_screen.dart';
class AlbumList_screen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new AlbumList_screenState();
  }
}

class AlbumList_screenState extends State<AlbumList_screen>{

  StreamController<Album> streamController;
  List<Album> list =[];
  @override
  void initState(){
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) =>
        setState(() => list.add(p)
        ), onDone: (){
      print("Album list stream finished");
    },
    onError: (error){
      print (error.toString());
    }
    );

    load(streamController);
  }

  load (StreamController sc) async {
    String url = "https://jsonplaceholder.typicode.com/albums";
    var client = new http.Client();

    var req = new http.Request('get',Uri.parse(url));

    var streamRes = await client.send(req);

    streamRes.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((e) =>e)
        .map((map)=> Album.fromJsonMap(map))
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
        title: Text("Album Streams"),
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

    return GestureDetector(
        onTap: (){
      ListTapped(list[index]);
    },
    child:ListTile(
      leading: Text(list[index].id.toString()),
      title: Text(list[index].title),
    )
    );
  }

  void ListTapped (Album album){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoList_screen(album: album)));
  }

}