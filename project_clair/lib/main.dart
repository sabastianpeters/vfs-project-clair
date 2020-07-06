/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:flutter/material.dart';
import 'package:project_clair/common.dart';



void main() {

    // creates and runs an app with a NoteListModel
    
    runApp(
        /// note that typically this component should be as low in the heirchy as possible. 
        /// for a small app like this, it's okay
        /// as well, if we want to use multiple Models, look at the `MultiProvider` class
        ChangeNotifierProvider( 
            create: (context) => NoteListModel(),
            child: App(),
        ),
    );
}



class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Project Clair',
            debugShowCheckedModeBanner: false,
            home: LandingScreen(),
            theme: _getTheme(context)
        );
    }




    ThemeData _getTheme (BuildContext context){

        return ThemeData(

            primaryColor: Colors.white,

            buttonTheme: ButtonThemeData(
                buttonColor: Color.fromRGBO(145, 136, 251, 1),
                textTheme: ButtonTextTheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            )
        );
    }

}
