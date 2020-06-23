/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';



// TODO: convert to stateful widget
class NoteListScreen extends StatelessWidget {



    
    // ## CALLBACKS ##

    void _onAddPressed (BuildContext context){
        gotoPage(context, CameraScreen());
    }


    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(
                title: Text("Your Notes"),
                centerTitle: true,
            ),
            body: BodyContainer(
                Column(
                    children: <Widget>[
                        
                        
                        Flexible(
                            child: NoteList()
                        ),

                        SizedBox( height: 16 ),

                        OutlineButton(
                            child: Text("ADD NEW"),
                            onPressed: () => _onAddPressed(context),
                        ),

                        SizedBox( height: 64 ),
                    ],
                ),
            ),
        );
    }

}