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


    UnmodifiableListView<NoteData> _noteList;


    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        return Consumer<NoteListModel>(
            builder: (context, model, child) => _buildList(context, model.noteList), /// builds list with provided notes
        );
        
    }




    // ## PRIVATE UTIL METHODS ##

    void _onDeletePressed (BuildContext context, int index){
        
        // removes item at index if desired
        _showVerifyDeleteDialog(
            context,
            () => Provider.of<NoteListModel>(context, listen: false).removeAt(index), /// removes if delete verified
            () {}
        );
        
    }


    Widget _buildList (BuildContext context, UnmodifiableListView<NoteData> noteList){
        
        _noteList = noteList;

        return ListView.builder(
            itemCount: noteList.length * 2,
            itemBuilder: (context, i){

                if(i.isOdd) return SizedBox( height: 16 ); /// spacing between notes
                return _buildCard(context, i ~/ 2); /// the cards themselves
            }
        );
    }
    

    Widget _buildCard (BuildContext context, int index){

        NoteData note = _noteList[index];

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
                                    onPressed: () => _onDeletePressed(context, index),
                                ),


                            ],
                        ),

                    ],
                )),
            )
        );
    }

    
    void _showVerifyDeleteDialog (BuildContext context, void Function() onYes, void Function() onNo,){

        showDialog(
            context: context,
            builder: (BuildContext context) {

                return AlertDialog(
                    title: Text("Are you sure you want to delete this note?"),
                    actions: <Widget>[

                        FlatButton(
                            color: Color.fromRGBO(224, 66, 110, 1),
                            child: Text("DELETE"),
                            onPressed: (){
                                onYes();
                                Navigator.of(context).pop(); /// closes the menu
                            },
                        ),

                        FlatButton(
                            child: Text("Cancel"),
                            onPressed: (){
                                onNo();
                                Navigator.of(context).pop(); /// closes the menu
                            },
                        ),
                    ],
                );
            }
        );
    }

}