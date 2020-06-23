/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:flutter/material.dart';
import 'package:project_clair/common.dart';



// TODO: convert to stateful widget
class CameraScreen extends StatelessWidget {


    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(
                title: Image.network(
                    "https://framerusercontent.com/projects/piSGerPqUbtGA1EE399C/assets/4096/CQ7n2opjGvmc8NP3IaQWhCeXObM.jpg?Expires=1592957114&Key-Pair-Id=APKAIDY47RVYVKGA6NJQ&Signature=KoNOnCSnkGBOGfqx8Lcf4rUZD3Gi8m~fgI9yIU7SDoFbsQ3h6ktdk51dR9Z-jd3Jy2EnMf2pCzwZHSTM3sz6z1KWsw8WVvRlx73DD~2gBDKv5EdOvtjZOK7q3qt7VgjKHN1EoXlMuEqyCrdPEpEMFbiNOVV47DoAyAHjEl6uggGWTr9loOwqbDsxqa7B7I5zBnF~12w38u0ElMQyAhKeHu0mpjziapEKiBGW7TnJ2MFB6uHXOMiHS9pd8KNQwta2LP0mbX5NC0XxQY8ZiC4OUWVGnwvurtz4MZpCTIyeNGuqYu9JzFRn~k7hCXGahTps0IhTPUh37UbBQ-wDsXOMWw__",
                    width: 177 * 1.2,
                    height: 107 * 1.2,
                ),
                centerTitle: true,
            ),

            body: BodyContainer(<Widget>[

                SizedBox(
                    width: double.infinity,
                    height: 320,

                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.all(
                                const Radius.circular(8),
                            ), 
                        ),

                        child: Center(
                            child: Icon(
                                Icons.camera_alt,
                                color: Colors.black.withAlpha(100),
                            ),
                        ),
                    )
                ),

                SizedBox( height: 16 ),

                SizedBox(
                    width: double.infinity,
                    height: 128,

                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.all(
                                const Radius.circular(8),
                            ), 
                        ),
                    )
                ),

                SizedBox( height: 16 ),

                RaisedButton(
                    child: Text("I'm Done!"),
                    onPressed: () => gotoPage(context, WordListScreen()),
                ),

                Spacer(),
            ])
        );
    }

}