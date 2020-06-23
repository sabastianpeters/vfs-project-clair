/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:flutter/material.dart';

import 'package:project_clair/screens/landing/landing_screen.dart';



void main() {
    runApp(App());
}



class App extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            title: 'Project Clair',
            home: LandingScreen(),
            theme: _getTheme()
        );
    }




    ThemeData _getTheme (){

        return ThemeData(
            primaryColor: Color.fromRGBO(145, 136, 251, 1),
            backgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                color: Colors.white,
            ),
            buttonTheme: ButtonThemeData(
                buttonColor: Color.fromRGBO(145, 136, 251, 1),
                textTheme: ButtonTextTheme.primary,
            )
        );
    }

}

