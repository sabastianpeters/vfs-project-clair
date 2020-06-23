/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:flutter/material.dart';
import 'package:project_clair/common.dart';



void main() {
    runApp(App());
}



class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Project Clair',
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

