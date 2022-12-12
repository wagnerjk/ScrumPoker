import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/cartas_enum.dart';

class Baralho extends StatelessWidget {
  final Size size;
  final List<CartasEnum> cartas;

  const Baralho({
    required this.size,
    required this.cartas,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CartasEnum cartasEnum = CartasEnum.cafe;
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          height: size.height * 0.18,
          child: DragTarget<CartasEnum>(
            onAccept: (data) => cartasEnum = data,
            builder: (context, _, __) => SvgPicture.asset(cartasEnum.imagem),
          ),
        ),
        SizedBox(
          height: size.height * 0.18,
          child: ListView.builder(
            itemCount: cartas.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: LongPressDraggable<CartasEnum>(
                  maxSimultaneousDrags: 1,
                  delay: const Duration(milliseconds: 300),
                  data: cartas.elementAt(index),
                  feedback: SvgPicture.asset(
                    cartas.elementAt(index).imagem,
                    height: size.height * 0.2,
                  ),
                  //   childWhenDragging: SvgPicture.asset(cartas.elementAt(index).imagem, width: 50),
                  child: SvgPicture.asset(
                    cartas.elementAt(index).imagem,
                    height: size.height * 0.18,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
