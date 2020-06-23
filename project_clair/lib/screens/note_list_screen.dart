/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';



// TODO: convert to stateful widget
class NoteListScreen extends StatelessWidget {


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
                            onPressed: () {},
                        ),

                        SizedBox( height: 64 ),
                    ],
                ),
            ),
        );
    }

}