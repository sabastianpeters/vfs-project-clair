/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';


class CameraScreen extends StatelessWidget {


    // ## CALLBACKS ##

    void _onDonePressed (BuildContext context){

        // Adds the new note to the model
        Provider.of<NoteListModel>(context, listen: false).add(
            NoteData(OutputText.value)
        );

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

                                child: Center(
                                    child: CameraComponent(),
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
                                
                                child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: OutputTextComponent()
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
                            ],
                        ),

                        Spacer(),
                    ]   
                )
            )
        );
    }

}