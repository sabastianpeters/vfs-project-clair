/*
    Copyright (C) 2020 Sabastian Peters

    A reference to common used things by Project Clair
*/


// ## LIBRARIES ##

export 'package:flutter/material.dart';



// ## SCREEN REFERENCE ##

export './screens/camera/camera_screen.dart';
export './screens/landing/landing_screen.dart';
export './screens/word_list/word_list_screen.dart';



// ## UTIL METHODS ##

import 'package:flutter/material.dart';

void gotoPage (BuildContext context, Widget page){
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => page
        )
    );
}




// ## UTIL COMPONENTRS ##

class BodyContainer extends StatelessWidget {


    // ## PUBLIC VARS ##

    final List<Widget> children;


    // ## CONSTRUCTORS ##

    BodyContainer(
        this.children, 
        { Key key }
    ) : super(key: key);

    factory BodyContainer.single( Widget child ){
        return BodyContainer(<Widget>[child]);
    }



    // ## FLUTTER METHODS ##

    @override
    Widget build(BuildContext context) {
        
        return Center(
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: 250,
                    maxHeight: 400
                ),
                child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children
                    ),
                ),
            ),
        );
    }

}