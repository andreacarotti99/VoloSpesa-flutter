import 'package:VoloSpesa/choosepage.dart';
import 'package:VoloSpesa/theame.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:VoloSpesa/models.dart';

class ConfirmationPage extends StatelessWidget {
  BoomerInfo boomerInfo;
  ConfirmationPage({Key key, @required this.boomerInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              width: 400,
              height: 300,
              child: Text('Grazie per averci comunicato la tua spesa, un volonatrio sarà presto in contatto con te, premi CONFERMA per mandare la richiesta',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Averta',
                  fontSize: 24.0,
              )),
            ),
            
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Material(
                  elevation: 10.0,
                  shadowColor: Colors.black45,
                  shape: StadiumBorder(),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.green[300],
                  child: InkWell(
                    onTap: () {
                      uploadBoomerInfo(boomerInfo.name, boomerInfo.address, boomerInfo.phone, boomerInfo.groceries, boomerInfo.lat, boomerInfo.long);
                      print(boomerInfo.groceries);
                      print(boomerInfo.name);
                      print(boomerInfo.address);
                      print(boomerInfo.phone);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChoosePage()));

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 20.0,
                          ),
                          child: Text(
                            'CONFERMA',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Averta',
                              fontSize: 16.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),







          ]
        ),
      )
    );
  }
}

Future<http.Response> uploadBoomerInfo(String nome, String indirizzo, String telefono, String spesa, double latitudine, double longitudine) async {
  final http.Response response = await http.post(
    'https://volospesa-server.herokuapp.com/api/v1/messages',
    headers: {
      'content-type': 'application/json' 
    },
    body: jsonEncode(
      <String, dynamic>{
      'nome': nome,
      'indirizzo': indirizzo,
      'telefono': telefono,
      'spesa': spesa,
      'latitudine' : latitudine,
      'longitudine' : longitudine
      }
    ),
  );
  if (response.statusCode == 200) {
    print('POST avvenuta correttamente');
  }
  else {
    print('Errore durante la POST');   
    print(response.statusCode);   
  }
}
