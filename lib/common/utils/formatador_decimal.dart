class FormatadorDecimal {
  static String formatarComVirgula(double valor) => valor.toStringAsFixed(2).replaceAll('.', ',');
  static String formatar(double valor) => valor.toStringAsFixed(2);
}
