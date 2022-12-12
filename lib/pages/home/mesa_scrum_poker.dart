// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';

import '../../models/sala.dart';

class MesaScrumPoker extends StatelessWidget {
  final Size size;
  final Sala sala;

  const MesaScrumPoker({
    required this.size,
    required this.sala,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.05),
      height: size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.elliptical(80, 100)),
        border: Border.all(width: 20),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/imagens/textura_verde.jpg',
          ),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.4),
          child: Text(
            sala.descricao,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white60,
            ),
          ),
        ),
      ),
    );
  }
}
