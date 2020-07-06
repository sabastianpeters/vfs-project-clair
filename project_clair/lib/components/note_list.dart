/*
    Copyright (C) 2020 Sabastian Peters

    A component for displaying a list of notes
*/

import 'package:project_clair/common.dart';


class NoteList extends StatefulWidget {

    @override
    NoteListState createState() => NoteListState();

}

class NoteListState extends State<NoteList> {



    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        return Consumer<NoteListModel>(
            builder: (context, model, child) => _buildList(context, model.noteList), /// builds list with provided notes
        );
        
    }




    // ## PRIVATE UTIL METHODS ##

    Widget _buildList (BuildContext context, UnmodifiableListView<NoteData> noteList){
        
        return ListView.builder(
            itemCount: noteList.length * 2,
            itemBuilder: (context, i){

                if(i.isOdd) return SizedBox( height: 16 ); /// spacing between notes
                return _buildCard(context, noteList[i ~/ 2]); /// the cards themselves
            }
        );
    }
    

    Widget _buildCard (BuildContext context, NoteData note){

        return Card(
            child: Container(
                padding: EdgeInsets.all(4),
                child: IntrinsicHeight( child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        
                        // Body Text

                        Container(
                            padding: EdgeInsets.all(16),
                            child: Text(note.body),
                        ),


                        Spacer(),

                        Column(
                            mainAxisAlignment: MainAxisAlignment.end, 
                            children: <Widget>[
                                
                                // Action Items

                                IconButton(
                                    icon: Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(224, 66, 110, 1),
                                    ),
                                    onPressed: () {},
                                ),


                            ],
                        ),

                    ],
                )),
            )
        );
    }

}