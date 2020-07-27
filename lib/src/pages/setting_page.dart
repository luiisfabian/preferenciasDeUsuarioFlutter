import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuario.dart';
import 'package:preferencias_usuario/src/widgets/menu_widwet.dart';

class SettingPage extends StatefulWidget {
  static final String routeName = 'setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _colorSegundario;
  int _genero;
  String nombreUsuario = "pedro";

  TextEditingController _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    //   cargarPref();
    super.initState();
     prefs.ultimaPagina = SettingPage.routeName;
    _genero = prefs.genero;
    _colorSegundario = prefs.colorSegundario;
    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  // cargarPref() async{
  //         SharedPreferences prefs = await SharedPreferences.getInstance();
  //         _genero = prefs.getInt("genero");
  //         setState(() {

  //         });

  // }

  _setSelectedRadioButton(int valor) {
    setState(() {
      prefs.genero = valor;
      _genero = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MenuWidget(),
        appBar: AppBar(
          title: Text("Ajustes"),
          backgroundColor: (prefs.colorSegundario) ? Colors.teal : Colors.green,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "settings",
                style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            SwitchListTile(
                value: _colorSegundario,
                title: Text("Color Segundario"),
                onChanged: (value) {
                  setState(() {
                    _colorSegundario = value;
                    prefs.colorSegundario = value;
                  });
                }),
            RadioListTile(
              value: 1,
              title: Text("Masculino"),
              groupValue: _genero,
              onChanged: _setSelectedRadioButton,
            ),
            RadioListTile(
              value: 2,
              title: Text("Femenino"),
              groupValue: _genero,
              onChanged: _setSelectedRadioButton,
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: "Nombre",
                  //  helperText: "Nombre de la persona",
                ),
                onChanged: (value) {
                  nombreUsuario = value;

                  prefs.nombreUsuario = value;
                },
              ),
            )
          ],
        ));
  }
}
