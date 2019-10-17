import './Homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class viewdata extends StatefulWidget {
  @override
  _viewdataState createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
  final String url = "http://userapi.tk/";
  var data;
  bool isLoading = true;
  void initState() {
    super.initState();
    this.getjsondata();
  }

  Future getjsondata() async {
    var response = await http.get(Uri.encodeFull(url));
    setState(() {
      var convertdatatojson = json.decode(response.body);
      data = convertdatatojson;
      isLoading = false;
    });
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_circle,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      ),
      body: Container(
          child: Center(
              child: isLoading
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, index) => Column(
                            children: <Widget>[
                              Card(
                                  child: Container(
                                height: 200,
                                width: 300,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Name",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["Name"],
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Text(
                                        "mobile",
                                        style: TextStyle(color: Colors.teal),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["Mobile"],
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Text(
                                        "Email_Id",
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["EmailID"],
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Text(
                                        "Gender",
                                        style: TextStyle(color: Colors.cyan),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["Gender"],
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Text(
                                        "BirthDay",
                                        style: TextStyle(
                                            color: Colors.amberAccent),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          data[index]["Birthday"],
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          )))),
    );
  }

  // ListView listView() {
  //   return ListView.builder(
  //       itemCount: data.lenght,
  //       itemBuilder: (BuildContext ctx, index) {
  //         return Padding(

  //           padding: const EdgeInsets.symmetric(vertical: 30),
  //           child: SizedBox(
  //             height: 300,
  //             child: Padding(
  //               padding: const EdgeInsets.all(2.0),
  //               child: Card(
  //                 elevation: 17,
  //                 child: ListView(
  //                   children: <Widget>[
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["Name"])
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["Mobile"])
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["EmailID"])
  //                         ],
  //                       ),
  //                     ),

  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["EmailID"])
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["Gender"])
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[
  //                           Text("help :"),
  //                           Text(data[index]['help'])
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 50,
  //                       width: 100,
  //                       child: Row(
  //                         children: <Widget>[

  //                           Text(data[index]["Birthday"])
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }
}
