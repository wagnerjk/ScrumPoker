enum CartasEnum {
  zero(0, 'assets/imagens/cartas/zero.svg'),
  meio(0.5, 'assets/imagens/cartas/meio.svg'),
  um(1, 'assets/imagens/cartas/um.svg'),
  dois(2, 'assets/imagens/cartas/dois.svg'),
  tres(3, 'assets/imagens/cartas/tres.svg'),
  cinco(5, 'assets/imagens/cartas/cinco.svg'),
  oito(8, 'assets/imagens/cartas/oito.svg'),
  treze(13, 'assets/imagens/cartas/treze.svg'),
  vinte(20, 'assets/imagens/cartas/vinte.svg'),
  quarenta(40, 'assets/imagens/cartas/quarenta.svg'),
  cem(100, 'assets/imagens/cartas/cem.svg'),
  infinito(999999, 'assets/imagens/cartas/infinito.svg'),
  cafe(900, 'assets/imagens/cartas/cafe.svg');

  final num numero;
  final String imagem;
  const CartasEnum(this.numero, this.imagem);
}
