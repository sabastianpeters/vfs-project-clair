/*
    Copyright (C) 2020 Itzel Salvador

    Widget for realtime image detection
*/

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'package:project_clair/helpers/output_helper.dart';

class CameraComponent extends StatefulWidget {

    @override
    _CameraComponentState createState() => _CameraComponentState();

}

class _CameraComponentState extends State<CameraComponent> {
  
    CameraController controller;
    List<CameraDescription> cameras = [];

    bool isInitialized = false;
    bool isDetecting = false;
    bool isStreaming = false;

    bool isModelLoaded = false;
    List outputs = List();

    OutputText outputText = OutputText();

    @override
    void initState() {

        super.initState();
        
        _initializeModel();

        try {
          WidgetsFlutterBinding.ensureInitialized();
          availableCameras().then((availableCameras) {
            cameras = availableCameras;
            if(cameras != null)_initializeCamera();
          });
        } on CameraException catch (e) {
            print(e.code);
        }

    } 

    @override
    void dispose() {

        controller?.dispose();
        super.dispose();

    }

    _initializeModel(){

        loadModel().then((value){
            setState((){
                isModelLoaded = true;
            });
        });

    }


    _initializeCamera(){

        controller = CameraController(cameras.last, ResolutionPreset.medium);
        controller.initialize().then((_) {

            if (!mounted) {
                return;
            }
            setState(() {
                isInitialized = true;
            });

            classifyImage();

        });
    }

    // Starts streaming and call the model to detect images
    classifyImage() async{

        controller.startImageStream((CameraImage image) {

            if (!isModelLoaded) return;
            if(!isDetecting){
                try {
                    runModelOnImage(image);
                    appendOutput();
                } catch (e) {
                    print(e);
                }
            }
            isDetecting = false;

        });
    
    }

    //Appends new letter to final word
    appendOutput(){

        var output = '';

        try{

            // Get label from model
            // Parsing to string. Original format index, result [0A]
            var label = outputs[0]["label"].toString();
            output = label[label.length-1];
          //  print("output: "+output);

            if(outputText.getValue() == 'none')
                outputText.setValue(output);
            else{
                // Avoids repeating letters
                // I wanted to avoid this output: aaaaaaaaaccccccc
                if(!label.contains('none') && outputs[0]["confidence"] > 0.60)
                    outputText.appendLetter(output);
            }// else
           // print("Get value" + outputText.getValue());
        } catch (e) {
            print(e);
        } //catch

    }

    //Runs every frame
    runModelOnImage(CameraImage image) async{

        var recognitions = await Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {return plane.bytes;}).toList(),// required
            imageHeight: image.height,
            imageWidth: image.width,
            imageMean: 127.5,   // defaults to 127.5
            imageStd: 127.5,    // defaults to 127.5
            rotation: 90,       // defaults to 90, Android only
            numResults: 5,      // defaults to 5
            threshold: 0.1,     // defaults to 0.1
            asynch: true        // defaults to true
        );

        // Update outputs list with recognition results
        setState(() {
            isDetecting = true;
            outputs = recognitions;
        });

      }
  
    //Loading model resources
    loadModel() async{

        await Tflite.loadModel(
            model: "assets/model_unquant.tflite",
            labels: "assets/labels.txt"
        );

    }

    // Add the following to fix preview width & height
    /*
    AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller)
                ):
    */
    @override
    Widget build(BuildContext context) {

        return Container(
            child: Center(
                child: isInitialized ?
                    CameraPreview(controller) :
                    Icon(
                        Icons.camera_alt,
                        color: Colors.black.withAlpha(100),
                    )
            )
        );
    }
}

