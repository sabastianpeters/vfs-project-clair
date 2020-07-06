/*
    Copyright (C) 2020 Sabastian Peters

    A reference to common used things by Project Clair
*/


// ## LIBRARY REFERENCES ##

export 'package:flutter/material.dart';
export 'package:provider/provider.dart';
export 'dart:collection';



// ## SCREEN REFERENCES ##

export './screens/camera_screen.dart';
export './screens/landing_screen.dart';
export './screens/note_list_screen.dart';



// ## DATA REFERENCES ##

export './data/note_list_model.dart';
export './data/note_data.dart';



// ## COMPONENT REFERENCES ##

export './components/note_list.dart';
export './components/output_text.dart';
export './components/camera.dart';



// ## HELPERS ##

export 'package:project_clair/helpers/output_helper.dart';




// ## UTIL METHODS ##

import 'package:flutter/material.dart';

// goes to a new page (doesn't allow going back)
void gotoPage (BuildContext context, Widget page){
    Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute<void>(
            builder: (BuildContext context) => page
        ), 
        (r) => false
    );
}

// opens up a page (allows going back)
void openPage (BuildContext context, Widget page){
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => page
        )
    );
} 




// ## UTIL COMPONENTRS ##

class BodyContainer extends StatelessWidget {


    // ## PUBLIC VARS ##

    final Widget child;
    final EdgeInsets padding;


    // ## CONSTRUCTORS ##

    BodyContainer(
        this.child, 
        [this.padding]
    );



    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        
        return Align(
            alignment: Alignment.topCenter,

            child: Container(
                padding: this.padding ?? EdgeInsets.symmetric(horizontal: 32, vertical: 16),

                child: ConstrainedBox(
                    constraints: BoxConstraints( maxWidth: 300 ),

                    child: Container(
                        child: this.child
                    ),
                ),
            )
        );
    }

}