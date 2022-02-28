import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;
  ServerStatus get serverStatus => this._serverStatus;

  // conectarse con el socket atravez de esta variable
  IO.Socket get socket => this._socket;
  Function get emit => this._socket.emit;
  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // Dart client
    this._socket = IO.io('http://192.168.30.226:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    this._socket.onConnect((_) {
      print('conectado');
      _serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    this._socket.onDisconnect((_) {
      print('desconectado');
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    // this._socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo mensaje');
    //   print('nombre:' + payload['nombre']);
    //   print('mensaje:' + payload['mensaje']);
    //   print('mensaje2:' + payload['mensaje2']);
    // });
  }
}
