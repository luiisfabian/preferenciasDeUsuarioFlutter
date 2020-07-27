import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPref() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET Y SET DEL GENERO

  get genero {
    return this._prefs.getInt("genero") ?? 1;
  }

  set genero(int value) {
    _prefs.setInt("genero", value);
  }

  get colorSegundario {
    return this._prefs.getBool("colorSecundario") ?? false;
  }

  set colorSegundario(bool value) {
    _prefs.setBool("colorSecundario", value);
  }

  get nombreUsuario {
    return this._prefs.getString("nombreUsuario") ?? "";
  }

  set nombreUsuario(String value) {
    _prefs.setString("nombreUsuario", value);
  }


  get ultimaPagina {
    return this._prefs.getString("ultimaPagina") ?? "home";
  }

  set ultimaPagina(String value) {
    _prefs.setString("ultimaPagina", value);
  }
}
