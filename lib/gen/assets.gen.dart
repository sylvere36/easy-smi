/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.dev
  String get aDev => 'assets/env/.dev';

  /// File path: assets/env/.prod
  String get aProd => 'assets/env/.prod';

  /// File path: assets/env/.stage
  String get aStage => 'assets/env/.stage';

  /// List of all assets
  List<String> get values => [aDev, aProd, aStage];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/icon.jpg
  AssetGenImage get icon => const AssetGenImage('assets/icon/icon.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [icon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/login.png
  AssetGenImage get login => const AssetGenImage('assets/images/login.png');

  /// File path: assets/images/man.png
  AssetGenImage get man => const AssetGenImage('assets/images/man.png');

  /// File path: assets/images/microsoft.png
  AssetGenImage get microsoft =>
      const AssetGenImage('assets/images/microsoft.png');

  /// File path: assets/images/onboarding_1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding_1.png');

  /// File path: assets/images/onboarding_2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding_2.png');

  /// File path: assets/images/pattern.png
  AssetGenImage get pattern => const AssetGenImage('assets/images/pattern.png');

  /// File path: assets/images/port_cotonou.png
  AssetGenImage get portCotonou =>
      const AssetGenImage('assets/images/port_cotonou.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    google,
    login,
    man,
    microsoft,
    onboarding1,
    onboarding2,
    pattern,
    portCotonou,
  ];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/svgs/bell.svg');

  /// File path: assets/svgs/bell_bold.svg
  SvgGenImage get bellBold => const SvgGenImage('assets/svgs/bell_bold.svg');

  /// File path: assets/svgs/box.svg
  SvgGenImage get box => const SvgGenImage('assets/svgs/box.svg');

  /// File path: assets/svgs/document.svg
  SvgGenImage get document => const SvgGenImage('assets/svgs/document.svg');

  /// File path: assets/svgs/edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/svgs/edit.svg');

  /// File path: assets/svgs/event.svg
  SvgGenImage get event => const SvgGenImage('assets/svgs/event.svg');

  /// File path: assets/svgs/formation.svg
  SvgGenImage get formation => const SvgGenImage('assets/svgs/formation.svg');

  /// File path: assets/svgs/home.svg
  SvgGenImage get home => const SvgGenImage('assets/svgs/home.svg');

  /// File path: assets/svgs/hot.svg
  SvgGenImage get hot => const SvgGenImage('assets/svgs/hot.svg');

  /// File path: assets/svgs/jam_blue.svg
  SvgGenImage get jamBlue => const SvgGenImage('assets/svgs/jam_blue.svg');

  /// File path: assets/svgs/jam_green.svg
  SvgGenImage get jamGreen => const SvgGenImage('assets/svgs/jam_green.svg');

  /// File path: assets/svgs/jam_orange.svg
  SvgGenImage get jamOrange => const SvgGenImage('assets/svgs/jam_orange.svg');

  /// File path: assets/svgs/jam_purple.svg
  SvgGenImage get jamPurple => const SvgGenImage('assets/svgs/jam_purple.svg');

  /// File path: assets/svgs/jam_red.svg
  SvgGenImage get jamRed => const SvgGenImage('assets/svgs/jam_red.svg');

  /// File path: assets/svgs/log_out.svg
  SvgGenImage get logOut => const SvgGenImage('assets/svgs/log_out.svg');

  /// File path: assets/svgs/mail.svg
  SvgGenImage get mail => const SvgGenImage('assets/svgs/mail.svg');

  /// File path: assets/svgs/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/svgs/menu.svg');

  /// File path: assets/svgs/message.svg
  SvgGenImage get message => const SvgGenImage('assets/svgs/message.svg');

  /// File path: assets/svgs/office-stamp-document.svg
  SvgGenImage get officeStampDocument =>
      const SvgGenImage('assets/svgs/office-stamp-document.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    bell,
    bellBold,
    box,
    document,
    edit,
    event,
    formation,
    home,
    hot,
    jamBlue,
    jamGreen,
    jamOrange,
    jamPurple,
    jamRed,
    logOut,
    mail,
    menu,
    message,
    officeStampDocument,
  ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/fr-FR.json
  String get frFR => 'assets/translations/fr-FR.json';

  /// List of all assets
  List<String> get values => [enUS, frFR];
}

class Assets {
  const Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
