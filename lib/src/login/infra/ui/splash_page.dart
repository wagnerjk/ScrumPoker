import 'package:flutter/material.dart';
import 'package:scrumpoker/src/login/infra/ui/login_page.dart';
import 'package:scrumpoker/utils/nav.dart';

/// Splashscreen do app, representa a tela de carregamento do app
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // Delay de 3 segundos
    Future futureDelay = Future.delayed(Duration(seconds: 4));
    // Quando todas as future terminarem faz a validação
    Future.wait([futureDelay]).then((List values) {
      // Redireciona para a tela de login
      push(context, LoginPage(), replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: FlutterLogo(
            size: 150,
          ),
        ),
      ],
    );
  }
}
