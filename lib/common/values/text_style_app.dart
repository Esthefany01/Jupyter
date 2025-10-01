import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextStyleApp {
  static const TextStyle _font09 = TextStyle(fontSize: 9, fontFamily: 'Quicksand');
  static const TextStyle _font10 = TextStyle(fontSize: 10, fontFamily: 'Quicksand');
  static const TextStyle _font11 = TextStyle(fontSize: 11, fontFamily: 'Quicksand');
  static const TextStyle _font12 = TextStyle(fontSize: 12, fontFamily: 'Quicksand');
  static const TextStyle _font13 = TextStyle(fontSize: 13, fontFamily: 'Quicksand');
  static const TextStyle _font14 = TextStyle(fontSize: 14, fontFamily: 'Quicksand');
  static const TextStyle _font16 = TextStyle(fontSize: 16, fontFamily: 'Quicksand');
  static const TextStyle _font18 = TextStyle(fontSize: 18, fontFamily: 'Quicksand');
  static const TextStyle _font20 = TextStyle(fontSize: 20, fontFamily: 'Quicksand');
  static const TextStyle _font22 = TextStyle(fontSize: 22, fontFamily: 'Quicksand');
  static const TextStyle _font24 = TextStyle(fontSize: 24, fontFamily: 'Quicksand');

  static MaterialTextStyle font09 = MaterialTextStyle(_generateVariants(_font09));
  static MaterialTextStyle font10 = MaterialTextStyle(_generateVariants(_font10));
  static MaterialTextStyle font11 = MaterialTextStyle(_generateVariants(_font11));
  static MaterialTextStyle font12 = MaterialTextStyle(_generateVariants(_font12));
  static MaterialTextStyle font13 = MaterialTextStyle(_generateVariants(_font13));
  static MaterialTextStyle font14 = MaterialTextStyle(_generateVariants(_font14));
  static MaterialTextStyle font16 = MaterialTextStyle(_generateVariants(_font16));
  static MaterialTextStyle font18 = MaterialTextStyle(_generateVariants(_font18));
  static MaterialTextStyle font20 = MaterialTextStyle(_generateVariants(_font20));
  static MaterialTextStyle font22 = MaterialTextStyle(_generateVariants(_font22));
  static MaterialTextStyle font24 = MaterialTextStyle(_generateVariants(_font24));

  static Map<int, TextStyle> _generateVariants(TextStyle base) {
    return {
      100: base.copyWith(fontWeight: FontWeight.w100),
      200: base.copyWith(fontWeight: FontWeight.w200),
      300: base.copyWith(fontWeight: FontWeight.w300),
      400: base.copyWith(fontWeight: FontWeight.w400),
      500: base.copyWith(fontWeight: FontWeight.w500),
      600: base.copyWith(fontWeight: FontWeight.w600),
      700: base.copyWith(fontWeight: FontWeight.w700),
      800: base.copyWith(fontWeight: FontWeight.w800),
      900: base.copyWith(fontWeight: FontWeight.w900),
    };
  }
}

class MaterialTextStyle extends TextStyleSwatch<int> {
  const MaterialTextStyle(super.swatch);

  TextStyle get shade100 => this[100]!;
  TextStyle get shade200 => this[200]!;
  TextStyle get shade300 => this[300]!;
  TextStyle get shade400 => this[400]!;
  TextStyle get shade500 => this[500]!;
  TextStyle get shade600 => this[600]!;
  TextStyle get shade700 => this[700]!;
  TextStyle get shade800 => this[800]!;
  TextStyle get shade900 => this[900]!;
}

class TextStyleSwatch<T> extends TextStyle {
  @protected
  final Map<T, TextStyle> _swatch;

  const TextStyleSwatch(this._swatch);

  TextStyle? operator [](T index) => _swatch[index];

  @override
  bool operator ==(covariant TextStyleSwatch<T> other) {
    if (identical(this, other)) return true;
    return mapEquals(other._swatch, _swatch);
  }

  @override
  int get hashCode => _swatch.hashCode;
}
