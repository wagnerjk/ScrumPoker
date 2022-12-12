// ignore_for_file: public_member_api_docs, sort_constructors_first, import_of_legacy_library_into_null_safe

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/cartas_enum.dart';
import '../../models/votacao.dart';
import '../../services/firebase_service.dart';
import '../../widgets/text_error.dart';

class ParticipantesSala extends StatelessWidget {
  final String idSala;

  const ParticipantesSala({
    required this.idSala,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseService().votacoesStream.where('hashSala', isEqualTo: idSala).snapshots(),
      builder: (context, snapshot) {
        // Se não tiver dados ou ocorrer erro
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextError('Nenhum registro encontrado até o momento'),
          );
        }
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextError('Não foi possível buscar os dados'),
          );
        }
        // Obtém a lista de snapshots de votacões
        List<DocumentSnapshot> listaSnapsVotacoes = snapshot.data!.docs;
        // Converte para lista de votações
        List<dynamic> votacoes = listaSnapsVotacoes
            .map(
              (snapshot) => Votacao.fromMap(snapshot.data() as Map<String, dynamic>),
            )
            .toList();
        for (var i = 0; i < votacoes.length; i++) {
          if (i == 0) {
            return _Jogador(
              size: size,
              left: size.width * 0.43,
              top: size.height * 0.02,
              cartaEmbaixo: true,
              cartaLadoDireito: false,
            );
          } else if (i % 2 == 0) {
            return _Jogador(
              size: size,
              left: size.width * 0.03,
              bottom: size.height * max(0.2, (0.85 - (((i - 1) / votacoes.length * 7) / 10))),
            );
          } else {
            return _Jogador(
              size: size,
              right: size.width * 0.03,
              bottom: size.height * max(0.2, (0.85 - ((i / votacoes.length * 7) / 10))),
              cartaLadoDireito: false,
            );
          }
        }
        return Container();
      },
    );
  }
}

class _Jogador extends StatelessWidget {
  final Size size;
  final double? left;
  final double? right;
  final double? bottom;
  final double? top;
  final bool cartaLadoDireito;
  final bool cartaEmbaixo;

  const _Jogador({
    required this.size,
    this.left,
    this.right,
    this.bottom,
    this.top,
    this.cartaLadoDireito = true,
    this.cartaEmbaixo = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: Stack(
        children: [
          if (cartaEmbaixo)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: size.aspectRatio * 50,
                  child: const Text(
                    'W',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            )
          else
            Row(
              children: [
                if (!cartaLadoDireito) const SizedBox(width: 34),
                CircleAvatar(
                  radius: size.aspectRatio * 50,
                  child: const Text(
                    'W',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                if (cartaLadoDireito) const SizedBox(width: 34),
              ],
            ),
          Positioned(
            right: cartaEmbaixo || cartaLadoDireito ? 0 : null,
            left: !cartaEmbaixo || cartaLadoDireito ? null : 0,
            bottom: cartaEmbaixo ? 0 : null,
            child: SvgPicture.asset(
              CartasEnum.cem.imagem,
              height: size.height * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
