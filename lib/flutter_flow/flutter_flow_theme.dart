// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color customColor1;
  late Color customColor2;
  late Color customColor3;
  late Color customColor4;
  late Color customColor5;
  late Color customColor6;
  late Color customColor7;
  late Color customColor8;
  late Color customColor9;
  late Color customColor10;
  late Color customColor11;
  late Color customColor12;
  late Color customColor13;
  late Color customColor14;
  late Color customColor15;
  late Color text;
  late Color gray10;
  late Color Gray10;
  late Color Gray40;
  late Color originalColorWhite;
  late Color textGrayDark;
  late Color greenGreen3;
  late Color colorsPurple;
  late Color Background;
  late Color gray20;
  late Color gray40;
  late Color originalColorIconGray;
  late Color originalColorTextGray;
  late Color originalColorLineGray;
  late Color gray100;
  late Color SuccessLight;
  late Color main100;
  late Color baseGray40;
  late Color baseGray80;
  late Color baseWhite;
  late Color secondary100;
  late Color gray60;
  late Color Main50;
  late Color colorsYellow;
  late Color WarningLight;
  late Color colorsBlue;
  late Color sub100;
  late Color colorsOrange;
  late Color grayPale;
  late Color keyColor;
  late Color textGray;
  late Color Sub50;
  late Color Sub10;
  late Color gray80;
  late Color warningLight;
  late Color main10;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFBBC05);
  late Color secondary = const Color(0xFF00046D);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFF4F4F4);
  late Color primaryText = const Color(0xFF121212);
  late Color secondaryText = const Color(0xFF757575);
  late Color primaryBackground = const Color(0xFFF4F4F4);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF3FE04E);
  late Color warning = const Color(0xFFFF1E43);
  late Color error = const Color(0xFFBE0123);
  late Color info = const Color(0xFFFFFFFF);

  late Color customColor1 = const Color(0xFFF4F4F4);
  late Color customColor2 = const Color(0xFF000000);
  late Color customColor3 = const Color(0xFF000000);
  late Color customColor4 = const Color(0xFFFFFFFF);
  late Color customColor5 = const Color(0xFFFFFFFF);
  late Color customColor6 = const Color(0xFF232323);
  late Color customColor7 = const Color(0xFF000000);
  late Color customColor8 = const Color(0xFFAF52DE);
  late Color customColor9 = const Color(0xFF4A5153);
  late Color customColor10 = const Color(0xFF0090A8);
  late Color customColor11 = const Color(0xFFFFCC00);
  late Color customColor12 = const Color(0xFF007AFF);
  late Color customColor13 = const Color(0xFFFF9500);
  late Color customColor14 = const Color(0xFFA1A1A1);
  late Color customColor15 = const Color(0xFFB0B0B0);
  late Color text = const Color(0xFF353535);
  late Color gray10 = const Color(0xFFF4F4F4);
  late Color Gray10 = const Color(0xFFF4F4F4);
  late Color Gray40 = const Color(0xFFD4D4D4);
  late Color originalColorWhite = const Color(0xFFFFFFFF);
  late Color textGrayDark = const Color(0xFF2C2C2E);
  late Color greenGreen3 = const Color(0xFF81E299);
  late Color colorsPurple = const Color(0xFFAF52DE);
  late Color Background = const Color(0xFFFFFBF7);
  late Color gray20 = const Color(0xFFEBEBEB);
  late Color gray40 = const Color(0xFFD4D4D4);
  late Color originalColorIconGray = const Color(0xFF9E9E9E);
  late Color originalColorTextGray = const Color(0xFF666666);
  late Color originalColorLineGray = const Color(0xFFE0E0E0);
  late Color gray100 = const Color(0xFF757575);
  late Color SuccessLight = const Color(0xFFE2FFEA);
  late Color main100 = const Color(0xFF2B79B6);
  late Color baseGray40 = const Color(0xFFB5BEC6);
  late Color baseGray80 = const Color(0xFF4A5660);
  late Color baseWhite = const Color(0xFFFFFFFF);
  late Color secondary100 = const Color(0xFFF04D23);
  late Color gray60 = const Color(0xFFBFBFBF);
  late Color Main50 = const Color(0xFFFDDD82);
  late Color colorsYellow = const Color(0xFFFFCC00);
  late Color WarningLight = const Color(0xFFFFF3F3);
  late Color colorsBlue = const Color(0xFF007AFF);
  late Color sub100 = const Color(0xFF78B152);
  late Color colorsOrange = const Color(0xFFFF9500);
  late Color grayPale = const Color(0xFFF0F0F0);
  late Color keyColor = const Color(0xFFFFAD0E);
  late Color textGray = const Color(0xFF363636);
  late Color Sub50 = const Color(0xFF8082B6);
  late Color Sub10 = const Color(0xFFE5E6F0);
  late Color gray80 = const Color(0xFFAAAAAA);
  late Color warningLight = const Color(0xFFFFF2F2);
  late Color main10 = const Color(0xFFFFF8E6);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Noto Sans JP';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Noto Sans JP';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Noto Sans JP';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Noto Sans JP';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Noto Sans JP';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Noto Sans JP';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Noto Sans JP';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Noto Sans JP';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Noto Sans JP';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Noto Sans JP';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.notoSansJp(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Noto Sans JP';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.notoSansJp(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Noto Sans JP';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.notoSansJp(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Noto Sans JP';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Noto Sans JP';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.notoSansJp(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Audiowide';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.audiowide(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
