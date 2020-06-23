/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';



// TODO: convert to stateful widget
class CameraScreen extends StatelessWidget {


    // ## CALLBACKS ##

    void _onDonePressed (BuildContext context){
        gotoPage(context, NoteListScreen());
    }

    void _onCancelPressed (BuildContext context){
        gotoPage(context, NoteListScreen());
    }



    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(
                title: Image.asset(
                    "assets/logo_icon.png",
                    height: 32,
                ),
                centerTitle: true,
            ),

            body: BodyContainer(
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                
                        SizedBox(
                            width: double.infinity,
                            height: 320,

                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple.shade100,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(8),
                                    ), 
                                ),

                                
                                // TODO: put camera here

                                child: Center(
                                    child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.black.withAlpha(100),
                                    ),
                                ),
                            )
                        ),

                        SizedBox( height: 16 ),

                        SizedBox(
                            width: double.infinity,
                            height: 128,

                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.all(
                                        const Radius.circular(8),
                                    ), 
                                ),


                                // TODO: put text output here
                                
                                child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Text("My Text Here")
                                )
                            )
                        ),

                        SizedBox( height: 16 ),

                        Row(
                            children: <Widget>[
                                RaisedButton(
                                    child: Text("I'm done!"),
                                    onPressed: () => _onDonePressed(context),
                                ),

                                SizedBox( width: 8 ),

                                RaisedButton(
                                    child: Text("Cancel"),
                                    color: Colors.grey.shade300,
                                    onPressed: () => _onCancelPressed(context),
                                ),
                            ],
                        ),

                        Spacer(),
                    ]   
                )
            )
        );
    }

}