
import 'package:flutter/material.dart';
import 'package:pdf_creation/reportview.dart';
void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("PDF Creator"),
      ),
      body:  Center(
        child:Container(
            margin: EdgeInsets.only(
                top: 30),
            height: 40,
            child: RaisedButton(
              
                shape:  RoundedRectangleBorder(
                  borderRadius:
                   BorderRadius.circular(5.0),
                ),
                child: Text(
                  'Get Report',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                color: Colors.black,
                onPressed:(){
                  reportView(context);
                }
            )
        )
      ),
      
    );
  }
}
