import 'package:flutter/services.dart';

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1. Remove todos os caracteres que não são dígitos
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // 2. APLICA O LIMITE
    // Se a quantidade de dígitos for maior que 8, corta a string para conter apenas os 8 primeiros.
    // Isso garante que o formato final não passe de DD/MM/AAAA.
    if (digitsOnly.length > 8) {
      digitsOnly = digitsOnly.substring(0, 8);
    }

    // 3. Adiciona as barras de formatação
    String formatted = '';
    for (int i = 0; i < digitsOnly.length; i++) {
      formatted += digitsOnly[i];
      // Adiciona a barra depois do dia (DD) e do mês (MM)
      if ((i == 1 || i == 3) && i < digitsOnly.length - 1) {
        formatted += '/';
      }
    }

    // 4. Retorna o valor formatado com o cursor no final do texto
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
