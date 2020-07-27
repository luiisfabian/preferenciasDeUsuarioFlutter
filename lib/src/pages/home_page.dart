import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/widgets/menu_widwet.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
         prefs.ultimaPagina = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.colorSegundario)? Colors.teal : Colors.green,
        title: Text("Preferencias de usuario"),
      ),
      drawer: MenuWidget(),
      body: Column(
        children: [
          Text("Color Segundario:  ${prefs.colorSegundario} "),
          Divider(),
          Text("Genero:   ${prefs.genero}"),
          Divider(),
          Text("Nombre de Usuario:  ${prefs.nombreUsuario}"),
          Divider(),
        ],
      ),
    );
  }

}
