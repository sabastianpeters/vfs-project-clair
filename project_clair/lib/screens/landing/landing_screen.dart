/*
    Copyright (C) 2020 Sabastian Peters
*/

import 'package:project_clair/common.dart';



class LandingScreen extends StatelessWidget {


    @override
    Widget build (BuildContext context){

        return Scaffold(
            body: _getBodyContainer(
                <Widget>[
                    Image.network(
                        "https://framerusercontent.com/projects/piSGerPqUbtGA1EE399C/assets/4096/CQ7n2opjGvmc8NP3IaQWhCeXObM.jpg?Expires=1592957114&Key-Pair-Id=APKAIDY47RVYVKGA6NJQ&Signature=KoNOnCSnkGBOGfqx8Lcf4rUZD3Gi8m~fgI9yIU7SDoFbsQ3h6ktdk51dR9Z-jd3Jy2EnMf2pCzwZHSTM3sz6z1KWsw8WVvRlx73DD~2gBDKv5EdOvtjZOK7q3qt7VgjKHN1EoXlMuEqyCrdPEpEMFbiNOVV47DoAyAHjEl6uggGWTr9loOwqbDsxqa7B7I5zBnF~12w38u0ElMQyAhKeHu0mpjziapEKiBGW7TnJ2MFB6uHXOMiHS9pd8KNQwta2LP0mbX5NC0XxQY8ZiC4OUWVGnwvurtz4MZpCTIyeNGuqYu9JzFRn~k7hCXGahTps0IhTPUh37UbBQ-wDsXOMWw__",
                        width: 177 * 1.2,
                        height: 107 * 1.2,
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 32),
                        child: Text(
                            "Clair, our transcribe assistance is here to help you",
                            textScaleFactor: 1.8,
                        ),
                    ),
                    SizedBox(
                        child: RaisedButton(
                            child: Text("Get Started"),
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            onPressed: () => _gotoCameraScreen(context),
                        )
                    )
                ],
            )
        );
    }



    // ## PRIVATE UTIL METHODS ##


    void _gotoCameraScreen (BuildContext context){
        gotoPage(context, CameraScreen());
    }


    // gets the widget that will contain the body
    Widget _getBodyContainer (List<Widget> children){

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