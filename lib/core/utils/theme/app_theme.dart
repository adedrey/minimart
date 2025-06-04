import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minimart/core/utils/theme/theme.dart';

const kFontFamily = 'FoxGrotesquePro';

final TextStyle kTextStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontFamily: kFontFamily,
  fontSize: FontSizes.textMD,
  fontFamilyFallback: const ['Roboto'],
);

final lightTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  scaffoldBackgroundColor: AppColors.kColorScaffold,
  fontFamily: kFontFamily,
  colorScheme:
      const ColorScheme.light().copyWith(surfaceTint: Colors.transparent),
  extensions: [
    AppTheme.light(),
  ],
);
final darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  scaffoldBackgroundColor: AppColors.kColorScaffold,
  fontFamily: kFontFamily,
  colorScheme:
      const ColorScheme.dark().copyWith(surfaceTint: Colors.transparent),
  extensions: [
    AppTheme.dark(),
  ],
);

class AppTheme extends ThemeExtension<AppTheme> {
  factory AppTheme.light() {
    return AppTheme._(
      backgroundTheme: const BackgroundTheme(
        scaffoldColor: AppColors.kColorScaffold,
        onPrimary: AppColors.kColorLightPurple,
      ),
      textStylesTheme: TextStylesTheme(
        titleLarge: kTextStyle.copyWith(
          fontSize: FontSizes.textLG,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: kTextStyle.copyWith(
          fontSize: FontSizes.textLG,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: kTextStyle.copyWith(
          fontSize: FontSizes.textSM,
          color: AppColors.kColorBlack,
        ),
        displayLarge: kTextStyle.copyWith(
          fontSize: FontSizes.textMD,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: kTextStyle.copyWith(
          fontSize: FontSizes.textSM,
          color: AppColors.kColorUnselected,
        ),
        bodyLarge: kTextStyle.copyWith(
          fontSize: FontSizes.sizesMD,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w700,
        ),
        primaryDisplaySmall: kTextStyle.copyWith(
          fontSize: FontSizes.textXL,
          color: AppColors.kColorGrey700,
        ),
        primaryTitleSmall: kTextStyle.copyWith(
          fontSize: FontSizes.sizesXS,
          color: AppColors.kColorGrey700,
          fontWeight: FontWeight.w600,
        ),
        inverseBodySmall: kTextStyle.copyWith(
          fontSize: FontSizes.textXL,
          color: AppColors.kColorSuccess500,
        ),
        inverseXtraBodySmall: kTextStyle.copyWith(
          fontSize: FontSizes.textXS,
          color: AppColors.kColorWhite,
        ),
        labelLarge: kTextStyle.copyWith(
          fontSize: FontSizes.textSM,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w700,
        ),
        labelSmall: kTextStyle.copyWith(
          fontSize: FontSizes.textXL,
          color: AppColors.kColorBlack,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: ApppBarTheme(
        title: kTextStyle.copyWith(
          fontSize: FontSizes.textXS,
          fontWeight: FontWeight.w600,
          color: AppColors.kColorGrey700,
        ),
        subtitle: kTextStyle.copyWith(
          fontSize: FontSizes.textXL,
          fontWeight: FontWeight.w600,
          color: AppColors.kColorGrey700,
        ),
      ),
      menuTheme: AppMenuTheme(
        primaryColor: AppColors.kColorPrimary,
        primaryIdleColor: Colors.transparent,
        outline: AppColors.kColorWhite,
        primaryTextStyle: kTextStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: FontSizes.textMD,
          color: AppColors.kColorPrimary,
        ),
        primaryIdleTextStyle: kTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: FontSizes.textMD,
          color: AppColors.kColorSurfaceVariant,
        ),
        iconSize: IconSizes.size1,
      ),
      buttonTheme: AppButtonTheme(
        primaryColor: AppColors.kColorPrimary,
        tertiaryColor: AppColors.kColorWhite,
        secondaryColor: AppColors.kColorGrey200,
        tertiaryBorderColor: AppColors.kColorGrey200,
        primaryTextStyle: kTextStyle.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: FontSizes.textSM,
          color: AppColors.kColorWhite,
        ),
      ),
      toastTheme: ToastTheme(
        successColor: AppColors.kColorSuccess500,
        primaryBody: kTextStyle.copyWith(
          fontSize: FontSizes.textSM,
          color: AppColors.kColorGrey700,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputTheme: InputTheme(
        hintStyle: kTextStyle.copyWith(
          fontSize: FontSizes.textSM,
          color: AppColors.kColorGrey300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: AppColors.kColorGrey200,
          ),
        ),
      ),
    );
  }

  factory AppTheme.dark() {
    return AppTheme.light();
  }

  const AppTheme._({
    required this.backgroundTheme,
    required this.textStylesTheme,
    required this.appBarTheme,
    required this.inputTheme,
    required this.buttonTheme,
    required this.toastTheme,
    required this.menuTheme,
  });

  final BackgroundTheme backgroundTheme;
  final TextStylesTheme textStylesTheme;
  final ApppBarTheme appBarTheme;
  final InputTheme inputTheme;
  final AppButtonTheme buttonTheme;
  final ToastTheme toastTheme;
  final AppMenuTheme menuTheme;

  @override
  ThemeExtension<AppTheme> copyWith({bool? lightMode}) {
    if (lightMode == null || lightMode == true) {
      return AppTheme.light();
    }
    return AppTheme.dark();
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }

    return AppTheme._(
      backgroundTheme: backgroundTheme.lerp(other.backgroundTheme, t),
      textStylesTheme: textStylesTheme.lerp(other.textStylesTheme, t),
      appBarTheme: appBarTheme.lerp(other.appBarTheme, t),
      inputTheme: inputTheme.lerp(other.inputTheme, t),
      toastTheme: toastTheme.lerp(other.toastTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      menuTheme: menuTheme.lerp(other.menuTheme, t),
    );
  }
}
