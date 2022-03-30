import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrumpoker/src/login/infra/ui/splash_page.dart';

/// Inicializa aplicativo
void main() async {
  // Chama o primeiro widget da árvore
  runApp(WidgetInicial());
}

/// App que representa o widget inicial/raiz da navegação dos widgets
class WidgetInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mantém orientação apenas retrato
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Inicializa MaterialApp
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrum Poker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashPage(), // Inicializa na Splash
    );
  }
}
