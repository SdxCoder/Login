import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/notification_service.dart';
import 'package:erply_assignment/ui/shared/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AddUserView extends StatefulWidget {
  final double margins;
  final double gutters;
  final int columns;
  AddUserView({Key key, this.margins, this.gutters, this.columns}) : super(key: key);

  _AddUserViewState createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {

   TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();


  
  @override
  void initState() { 
    super.initState();
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  }

  @override
  Widget build(BuildContext context) {
    Grid(context, widget.gutters, widget.margins, widget.columns);
    return Scaffold(
       body: Center(
         child: Container(
           width: Grid.giveColSpan(4),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               _loginForm( context)
             ],
           ),
         ),
       ),
    );
  }


  Widget _loginForm( BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Container(
            child: Theme(
              data: themeData.copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    hintText: "Name",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(
            height: widget.gutters,
          ),
          Container(
            child: Theme(
              data: themeData.copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(
            height: widget.gutters,
          ),
          Container(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: (_emailController.text.isEmpty &
                      _nameController.text.isEmpty)
                  ? null
                  : () async {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');

                    },
              child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        
                        Text(
                          "Save",
                          style: Theme.of(context).textTheme.button,
                        ),
                        SizedBox(width: 10,),
                        Icon(Icons.people,size: 16,),
                        
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

}