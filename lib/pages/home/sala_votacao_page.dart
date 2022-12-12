// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scrumpoker/pages/home/participantes_sala.dart';

import 'package:scrumpoker/pages/home/votacao_page.dart';

import '../../models/cartas_enum.dart';
import '../../models/sala.dart';
import '../../services/firebase_service.dart';
import 'baralho.dart';
import 'mesa_scrum_poker.dart';

class SalaVotacaoPage extends StatefulWidget {
  final DocumentSnapshot snapshotSala;

  const SalaVotacaoPage({super.key, required this.snapshotSala});

  @override
  State<SalaVotacaoPage> createState() => _SalaVotacaoPageState();
}

class _SalaVotacaoPageState extends State<SalaVotacaoPage> with WidgetsBindingObserver {
  /// Usuario logado
  var statusStream = StatusStream.carregando;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseService().salasStream.doc(widget.snapshotSala.id).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Sala salaStream = Sala(descricao: '...');
          // Se não tiver dados ou ocorrer erro
          statusStream = StatusStream.carregando;
          if (!snapshot.hasData) {
            statusStream = StatusStream.semDados;
          } else if (snapshot.hasError) {
            statusStream = StatusStream.erro;
          } else if (snapshot.data != null && snapshot.data.data() == null) {
            statusStream = StatusStream.salaExcluida;
          } else {
            // Obtém a snapshot da sala
            salaStream = Sala.fromMap(snapshot.data.data());
            statusStream = StatusStream.conectado;
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: _BodyVotacaoPage(
              sala: salaStream,
              statusStream: statusStream,
              idSala: widget.snapshotSala.id,
            ),
          );
        },
      ),
    );
  }
}

class _BodyVotacaoPage extends StatelessWidget {
  final Sala sala;
  final StatusStream statusStream;
  final String idSala;

  const _BodyVotacaoPage({
    required this.sala,
    required this.statusStream,
    required this.idSala,
  });

  @override
  Widget build(BuildContext context) {
    if (statusStream == StatusStream.carregando) {
      return const Center(child: CircularProgressIndicator());
    }
    if (statusStream == StatusStream.erro) {
      return const Center(child: Text('Ocorreu algum erro no carregamento dos dados'));
    }
    if (statusStream == StatusStream.semDados) {
      return const Center(child: Text('Nã há dados para apresentar'));
    }
    if (statusStream == StatusStream.salaExcluida) {
      return const Center(child: Text('A sala pode ter sido excluída'));
    }

    final size = MediaQuery.of(context).size;
    final cartas = sala.cartasSala;

    return SafeArea(
      child: Stack(
        children: [
          MesaScrumPoker(size: size, sala: sala),
          Baralho(size: size, cartas: cartas),
          ParticipantesSala(idSala: idSala),
        ],
      ),
    );
  }
}
