import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   TextEditingController name = TextEditingController();
   TextEditingController  email = TextEditingController();
   TextEditingController  mobile = TextEditingController();
    TextEditingController  gender = TextEditingController();
  TextEditingController  birthday = TextEditingController();
  


 

    void post() async {
       
    var result = await http.post("http://userapi.tk/", body: {
     
      "Name":name.text,
       "EmailID": email.text,
      "Mobile":mobile.text,
       "Gender": gender.text,
      "Birthday": birthday.text
       
    }
    );
    print(result.body);
    
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("save data"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter your name",labelText: "name",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    )),
                    controller: name,
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                    decoration: InputDecoration(hintText: "Enter your Email",labelText: "Email",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    )),
                    controller: email,
                ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: TextField(
                    decoration: InputDecoration(hintText: "Enter mobile",labelText: "mobile",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    )),
                    controller: mobile,
                ),
                 ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter Suggetion",labelText: "sugg",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    )),
                    controller: gender,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(hintText: "Enter birthday",labelText: "birthday",
                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    )),
                    controller: birthday,
                  ),
                ),
                
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed:(){ post();
                   setState(() {
                    name.text = "";
                    email.text = "" ;
                    mobile.text = "";
                   gender.text = "";
                   birthday.text = "";
                   });

                    },
                     minWidth: 200,
                    child: Text(" add on Api "),
                    color: Colors.cyan,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}