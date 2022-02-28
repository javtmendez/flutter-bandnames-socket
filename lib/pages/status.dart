import 'package:bandnames/models/band.dart';
import 'package:bandnames/services/socket_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
// socketService.socket.emit(event);
    Band _band;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text('ServerStatus:${socketService.serverStatus}')],
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: () {
            // _band={id:'31a',name:'GRUPO FERIL', votes:5};
            socketService.emit('emitir-mensaje', {
              'nombre': 'javier tzoc',
              'mensaje': 'hola mundo',
              'mensaje2': 'de la programacion'
            });
          }),
    );
  }
}
