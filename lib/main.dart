import 'package:erply_assignment/core/services/authentication_service.dart';
import 'package:erply_assignment/data/post_api_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Material(child: LayoutPanel())
    );
  }
}

class LayoutPanel extends StatelessWidget {
  const LayoutPanel({Key key}) : super(key: key);
  


  void login() async {
      final response = await AuthenticationService.create().launch(5874, "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0X2lzcyI6bnVsbCwidF9wdCI6ImMzYjk5YmJiNTk5YmJlYjE5NDBjZjZlMTVjMGRjMTljYWFhZGUyYTIiLCJ0X2lzc3QiOjE1NjI2ODQ2MTYsInRfcnQiOiI2YTcyNzM2MDU0ZmEwNzAyMGUwMzJjMjdhNjA4MWQzMTM2Mzk2OWRmIiwidF90dGwiOjg2NDAwLCJpZF9lbSI6ImNoc2FhZGFobWVkOTNAZ21haWwuY29tIiwiaWRfdGlkIjoiIiwicGVybXMiOlsiaWRlbnRpdHktYWRtaW5cL21hbnVhbCIsImlkZW50aXR5LWFkbWluXC9Vc2VyU2V0dGluZ3NcL2dldFVzZXJJbmZvIiwiaWRlbnRpdHktYWRtaW5cL1VzZXJTZXR0aW5nc1wvZWRpdFVzZXJJbmZvIiwiaWRlbnRpdHktYWRtaW5cL1VzZXJTZXR0aW5nc1wvY2hhbmdlUGFzc3dvcmQiLCJpZGVudGl0eS1hZG1pblwvVXNlclNldHRpbmdzXC9oYXNQYXNzd29yZCIsImlkZW50aXR5LWFkbWluXC9JbnZpdGF0aW9uXC9nZXQiLCJpZGVudGl0eS1hZG1pblwvSW52aXRhdGlvblwvY29uZmlybSIsImlkZW50aXR5LWFkbWluXC9JbnZpdGF0aW9uXC9jYW5jZWwiLCJpZGVudGl0eS1hZG1pblwvTGF1bmNocGFkXC9hY2NvdW50QWNjZXNzIiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvYXBwbGljYXRpb25zIiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvbGF1bmNoIiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvZmluZEFwcGxpY2F0aW9uIiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvY3JlYXRlQ29tcGFueSIsImlkZW50aXR5LWFkbWluXC9MYXVuY2hwYWRcL2dldEFwcFJlcXVlc3RTdGF0dXMiLCJpZGVudGl0eS1hZG1pblwvTGF1bmNocGFkXC9yZXF1ZXN0QWNjZXNzIiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvZ2V0VXNlckRlZmF1bHRDb21wYW55IiwiaWRlbnRpdHktYWRtaW5cL0xhdW5jaHBhZFwvZ2V0VXNlckNvbmZpcm1lZENvbXBhbmllcyIsImlkZW50aXR5LWFkbWluXC9MYXVuY2hwYWRcL3NldFVzZXJEZWZhdWx0Q29tcGFueSIsImlkZW50aXR5LWFkbWluXC9MYXVuY2hwYWRcL2dldEJhZGdlSW5mbyJdLCJ0X3YiOjIsInRfaXR2IjpbXX0.TibRJ0NKRf6m2IhjJWZUPkKGHaQPxiSOby3QCicOeyTQt8eUYKOZBQitYWYWxBnzZF4VIslvWyUw4QUntz3xQ5Pd2BcioJEr3r390DXoLFo6vYxf_UUqXhe_p9CosBFk2epMQqQEaZgsp2JSgCSld4YgfaRn96xE4ERWJdGota3fFbac7ImUa8Q5j8eBDOXdqb9QW21G6aCybyw22xEx1wic4w13vIU9LQkuC3egIuQzQaKDVCWC4u1-r3v_qJM1skDDR_8nc2KEENlpwIMQFX_QnqUkxEEg327GRy2X-e-bXIZUGAhLBxAXa67a8qrkYHLenLeR66Lly75gOJieLg");
      print("-----------------------------------------------------------------------------------");
      print(response.body);
  }

  @override
  Widget build(BuildContext context) {

    login();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
         if(constraints.maxWidth < 600){
           return Center(child: Text("Mobile"));
         }
          else{
           return Center(child: Text("Tablet"));
         }
      },
    );
  }
}

