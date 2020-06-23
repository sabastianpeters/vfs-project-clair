/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:flutter/material.dart';



// TODO: convert to stateful widget
class WordListScreen extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(
                title: Text("Your Phrases"),
                centerTitle: true,
            ),
        );
    }

}