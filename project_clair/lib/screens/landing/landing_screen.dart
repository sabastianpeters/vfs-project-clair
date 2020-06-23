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
                <Widget>[
                    
                    Image.network(
                        "https://framerusercontent.com/projects/piSGerPqUbtGA1EE399C/assets/4096/CQ7n2opjGvmc8NP3IaQWhCeXObM.jpg?Expires=1592957114&Key-Pair-Id=APKAIDY47RVYVKGA6NJQ&Signature=KoNOnCSnkGBOGfqx8Lcf4rUZD3Gi8m~fgI9yIU7SDoFbsQ3h6ktdk51dR9Z-jd3Jy2EnMf2pCzwZHSTM3sz6z1KWsw8WVvRlx73DD~2gBDKv5EdOvtjZOK7q3qt7VgjKHN1EoXlMuEqyCrdPEpEMFbiNOVV47DoAyAHjEl6uggGWTr9loOwqbDsxqa7B7I5zBnF~12w38u0ElMQyAhKeHu0mpjziapEKiBGW7TnJ2MFB6uHXOMiHS9pd8KNQwta2LP0mbX5NC0XxQY8ZiC4OUWVGnwvurtz4MZpCTIyeNGuqYu9JzFRn~k7hCXGahTps0IhTPUh37UbBQ-wDsXOMWw__",
                        width: 177 * 1.2,
                        height: 107 * 1.2,
                    ),

                    Container(
                        child: Text(
                            "Clair, our transcribe assistant is here to help you",
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
                EdgeInsets.symmetric(horizontal: 64, vertical: 128)
            )
        );
    }

}