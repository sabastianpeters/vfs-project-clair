/*
    Copyright (C) 2020 Itzel Salvador

    Widget to wrapper output's state
*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_clair/helpers/output_helper.dart';

class OutputTextComponent extends StatefulWidget {

    @override
    _OutputTextComponentState createState() => _OutputTextComponentState();

}

class _OutputTextComponentState extends State<OutputTextComponent> {
  
    OutputText resultText = OutputText();
    bool updateWord = false;
    String output = '';
    Timer timer;


    @override
    void initState() {
        super.initState();

        timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateOutputText());
    }

    @override
    void dispose() {
        timer?.cancel();
        super.dispose();
    }

    updateOutputText(){
      setState(() {
        updateWord = true;
      });
    }

    @override
    Widget build(BuildContext context) {

        return Container(
            child: resultText.getValue() != 'none' ? 
                  Text(resultText.getValue()) :
                  Text('Loading...')
        );
    }
}

