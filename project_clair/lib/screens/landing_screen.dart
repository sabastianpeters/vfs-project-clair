/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';



class LandingScreen extends StatelessWidget {


    @override
    Widget build (BuildContext context){

        return Scaffold(
            backgroundColor: Colors.white,
            
            body: BodyContainer(
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    
                        Image.asset(
                            "assets/logo.png",
                            width: 177,
                            height: 107,
                        ),

                        Container(
                            child: Text(
                                "Take down notes with our transcribe assistant, Clair.",
                                textScaleFactor: 1.8,
                            ),
                        ),

                        const SizedBox( height: 32 ),

                        SizedBox(
                            child: RaisedButton(
                                child: Text("Get Started"),
                                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                onPressed: () => gotoPage(context, CameraScreen()),
                            )
                        )
                    ],
                    
                ),
                
                EdgeInsets.symmetric(horizontal: 64, vertical: 128)
            )
        );
    }

}