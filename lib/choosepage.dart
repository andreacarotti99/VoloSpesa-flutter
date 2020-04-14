import 'package:flutter/material.dart';
import 'package:VoloSpesa/appbarmappage.dart';
import 'package:VoloSpesa/boomerfirstpage.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

Future<void>getLocation() async {
  askForLocation();
  var position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}

Future<void>askForLocation() async {
  final status = await Permission.locationWhenInUse.request();
}

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {

  // Future<void> requestPermission(Permission permission) async {
  //   PermissionStatus _permissionStatus = PermissionStatus.undetermined;
  //   final status = await permission.request();

  //   setState(() {
  //     print(status);
  //     _permissionStatus = status;
  //     print(_permissionStatus);
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //requestPermission(Permission.locationWhenInUse);
    
  }
 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: getLocation(),
          builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: primary,
                    height: 300,
                    child: Column(
                      children: <Widget>[
                      Center(
                        child: Image(
                          height: 200,
                          width: 200,
                          image: AssetImage('assets/images/logo.png')),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Center(
                            child: Text(
                              'Seleziona il profilo che meglio ti identifica', 
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Averta',
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0,
                                color: Colors.black
                              )
                            ),
                        ),
                      ),
                      ],
                    ),
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: FlatButton(
                          color: primary,
                          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage())),
                          child: Container(
                            
                            margin: EdgeInsets.all(4.0),
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                )
                              )
                              ],
                              color: secondary,
                              borderRadius: BorderRadius.circular(30.0),
                              
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Center(
                                  child: Image(image: new AssetImage("assets/images/kidrunning.png"))
                                ),
                               
                               SizedBox(
                                   height: 20.0,
                                ),
                              Text(
                                'Sono un Volontario', 
                                style: TextStyle(
                                  fontFamily: 'Averta',
                                  fontSize: 16.0,
                                  color: Colors.black
                                )
                              ),
                             ],
                            ),
                           
                          ),
                          )
                        ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        color: primary,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyFormsPage())),
                        child: Container(
                          margin: EdgeInsets.all(4.0),
                          height: 300,
                          width: 200,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                color: Colors.grey[300],
                                blurRadius: 10.0, // has the effect of softening the shadow
                                spreadRadius: 5.0, // has the effect of extending the shadow
                                offset: Offset(
                                  0.0, // horizontal, move right 10
                                  2.0, // vertical, move down 10
                                )
                              )
                              ],
                              color: secondary,
                              borderRadius: BorderRadius.circular(30.0),
                              
                            ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              
                              Center(
                                  child: Image(image: new AssetImage("assets/images/oldies.png"))
                                ),
                              //Image.asset('images/female.png',height: 100.0,width: 100.0,),
                              SizedBox(
                                  height: 20.0,
                              ),
                              Text(
                                'Sono anziano', 
                                style: TextStyle(
                                  fontFamily: 'Averta',
                                  fontSize: 16.0,
                                  color: Colors.black
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    ],
                  ),
                ],
              ),
          );
          
        }
        else {
            return SpinKitThreeBounce(color: secondary,);
          }
      }
    );
      
  }
}
