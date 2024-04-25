import 'package:flutter/material.dart';
import 'package:ensajuniverse/core/utils/size_utils.dart';
import 'package:ensajuniverse/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargePoppinsBlack900 =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargePoppinsPrimary =>
      theme.textTheme.bodyLarge!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  // Headline text style
  static get headlineMediumff000000 => theme.textTheme.headlineMedium!.copyWith(
        color: Color(0XFF000000),
      );
  static get headlineMediumff2b02d0 => theme.textTheme.headlineMedium!.copyWith(
        color: Color(0XFF2B02D0),
      );
  // Label text style
  static get labelMediumBluegray40001 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.blueGray40001,
      );
  static get labelMediumDeeppurpleA700 => theme.textTheme.labelMedium!.copyWith(
        color: appTheme.deepPurpleA700,
      );
  // Title text style
  static get titleMediumManropePrimaryContainer =>
      theme.textTheme.titleMedium!.manrope.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
        fontWeight: FontWeight.w800,
      );
  static get titleMediumPoppinsGray50 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray50,
      );
  static get titleMediumPoppinsPrimaryContainer =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(0.6),
      );
  static get titleSmallBlack90002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black90002,
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPoppinsPrimaryContainer =>
      theme.textTheme.titleSmall!.poppins.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleSmallPrimaryContainer => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primaryContainer.withOpacity(1),
      );
  static get titleSmallRed500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.red500,
        fontSize: 15.fSize,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get hanuman {
    return copyWith(
      fontFamily: 'Hanuman',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get manrope {
    return copyWith(
      fontFamily: 'Manrope',
    );
  }
}
