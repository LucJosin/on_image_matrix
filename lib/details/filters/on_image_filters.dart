part of on_image_matrix;

/// A list of filters that can be applyed to any widget.
///
/// Try yourself:
///
/// * [SVG Color Matrix Mixer](https://fecolormatrix.com/)
/// * [SVG Color Filter Playground](https://kazzkiq.github.io/svg-color-filter/)
///
/// See more:
///
/// * [rn-color-matrices](https://github.com/iyegoroff/rn-color-matrices/blob/master/index.ts)
/// * [finessing-fecolormatrix](https://alistapart.com/article/finessing-fecolormatrix/)
/// * [colormatrix-guide](https://docs.rainmeter.net/tips/colormatrix-guide/)
/// * [image-filters-in-flutter](https://retroportalstudio.medium.com/image-filters-in-flutter-no-package-required-6f8cb57ba0b)
class OnImageFilters {
  static int get _random => Random().nextInt(2);

  /// A matrix that represent the [normal] image.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A  -
  /// R  1, 0, 0, 0, 0,
  /// G  0, 1, 0, 0, 0,
  /// B  0, 0, 1, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get normal => const ColorFilter.matrix(<double>[
        1.0, // R
        0.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // R
        0.0, // G
        1.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [gray] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A  -
  /// R  0, 1, 0, 0, 0,
  /// G  0, 1, 0, 0, 0,
  /// B  0, 1, 0, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get gray => const ColorFilter.matrix(<double>[
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [gray] filter and a high exposure.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A  -
  /// R  1, 1, 1, 0, 0,
  /// G  1, 1, 1, 0, 0,
  /// B  1, 1, 1, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get grayHighExposure => const ColorFilter.matrix(<double>[
        1.0, // R
        1.0, // G
        1.0, // B
        0.0, // A
        0.0, // Offset
        //
        1.0, // R
        1.0, // G
        1.0, // B
        0.0, // A
        0.0, // Offset
        //
        1.0, // R
        1.0, // G
        1.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [gray] filter and a high brightness.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A  -
  /// R  0, 1, 0, 0, 50,
  /// G  0, 1, 0, 0, 50,
  /// B  0, 1, 0, 0, 50,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get grayHighBrightness =>
      const ColorFilter.matrix(<double>[
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        50.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        50.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        50.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [gray] filter and a low brightness.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A   -
  /// R  0, 1, 0, 0, -50,
  /// G  0, 1, 0, 0, -50,
  /// B  0, 1, 0, 0, -50,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get grayLowBrightness => const ColorFilter.matrix(<double>[
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        -50.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        -50.0, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        -50.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [invert] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R   G  B  A  -
  /// R  -1, 0, 0, 0, 255,
  /// G  0, -1, 0, 0, 255,
  /// B  0, 0, -1, 0, 255,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get invert => const ColorFilter.matrix(<double>[
        -1,
        0,
        0,
        0,
        255,
        0,
        -1,
        0,
        0,
        255,
        0,
        0,
        -1,
        0,
        255,
        0,
        0,
        0,
        1,
        0,
      ]);

  /// A matrix with a the [sepia] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///      R      G      B    A  -
  /// R  0.393, 0.769, 0.189, 0, 0,
  /// G  0.349, 0.686, 0.168, 0, 0,
  /// B  0.272, 0.534, 0.131, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get sepia => const ColorFilter.matrix(<double>[
        0.393,
        0.769,
        0.189,
        0,
        0,
        0.349,
        0.686,
        0.168,
        0,
        0,
        0.272,
        0.534,
        0.131,
        0,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);

  /// A matrix with a the [sepium] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///      R      G      B    A  -
  /// R  1.3, -0.3, 1.1, 0, 0,
  /// G  0, 0.333, 0.667, 0, 0,
  /// B  0, 0.125, 0.875, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get sepium => const ColorFilter.matrix(<double>[
        1.3,
        -0.3,
        1.1,
        0,
        0,
        0,
        0.333,
        0.667,
        0,
        0,
        0,
        0,
        0.125,
        0.875,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);

  /// A matrix with a the [protanomaly] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R   G  B  A  -
  /// R  0.817, 0.183, 0, 0, 0,
  /// G  0, 1.3, 0.2, 0, 0,
  /// B  0, 0.8, 0.2, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get protanomaly => const ColorFilter.matrix(<double>[
        0.817,
        0.183,
        0.0,
        0,
        0,
        0,
        1.3,
        0.2,
        0,
        0,
        0,
        0,
        0.8,
        0.2,
        0,
        0,
        0,
        0,
        1,
        0,
      ]);

  /// A matrix with a the [technicolor] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///      R       G       B    A  -
  /// R  1.912, -0.854, -0.091, 0, 0,
  /// G  -0.308, 1.765, -0.106, 0, 0,
  /// B  -0.231, -0.750, 1.842, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get technicolor => const ColorFilter.matrix(<double>[
        1.912, // R
        -0.854, // G
        -0.091, // B
        0.0, // A
        0.0, // Offset
        //
        -0.308, // R
        1.765, // G
        -0.106, // B
        0.0, // A
        0.0, // Offset
        //
        -0.231, // R
        -0.750, // G
        1.842, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [blueSky] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///    R  G  B  A  -
  /// R  1.912, -1, 0.183, 0, 0.046,
  /// G  0, 1, 0, 0, 0,
  /// B  0, 0, 1, 0, 0,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get blueSky => const ColorFilter.matrix(<double>[
        1.912, // R
        -1, // G
        0.183, // B
        0.0, // A
        0.046, // Offset
        //
        0.0, // R
        1.0, // G
        0.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // R
        0.0, // G
        1.0, // B
        0.0, // A
        0.0, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [kodachrome] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///      R       G       B    A    -
  /// R  1.128, -0.396, -0.039, 0, 0.152,
  /// G  -0.164, 1.083, -0.054, 0, -0.0000101651109560702,
  /// B  -0.167, -0.560, 1.601, 0, 0.042,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get kodachrome => const ColorFilter.matrix(<double>[
        1.128, // R
        -0.396, // G
        -0.039, // B
        0.0, // A
        0.152, // Offset
        //
        -0.164, // R
        1.083, // G
        -0.054, // B
        0.0, // A
        -0.0000101651109560702, // Offset
        //
        -0.167, // R
        -0.560, // G
        1.601, // B
        0.0, // A
        0.042, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [vintage] filter.
  ///
  /// Matrix:
  ///
  /// ```text
  ///      R      G      B     A    -
  /// R  0.627, 0.320, -0.039, 0, 0.037,
  /// G  0.025, 0.644, 0.032, 0, 0.029,
  /// B  0.046, -0.085, 0.524, 0, 0.020,
  /// A  0, 0, 0, 1, 0,
  /// ```
  static ColorFilter get vintage => const ColorFilter.matrix(<double>[
        0.627, // R
        0.320, // G
        -0.039, // B
        0.0, // A
        0.037, // Offset
        //
        0.025, // R
        0.644, // G
        0.032, // B
        0.0, // A
        0.029, // Offset
        //
        0.046, // R
        -0.085, // G
        0.524, // B
        0.0, // A
        0.020, // Offset
        //
        0.0, // AR
        0.0, // AG
        0.0, // AB
        1.0, // AA
        0.0, // Offset
      ]);

  /// A matrix with a the [hueRotateWith2] filter.
  static ColorFilter get hueRotateWith2 {
    var value = 2;
    return ColorFilter.matrix(<double>[
      (0.213) + (cos(value) * 0.787) - (sin(value) * 0.213),
      (0.715) - (cos(value) * 0.715) - (sin(value) * 0.715),
      (0.072) - (cos(value) * 0.072) + (sin(value) * 0.928),
      0,
      0,
      (0.213) - (cos(value) * 0.213) + (sin(value) * 0.143),
      (0.715) + (cos(value) * 0.285) + (sin(value) * 0.140),
      (0.072) - (cos(value) * 0.072) - (sin(value) * 0.283),
      0,
      0,
      (0.213) - (cos(value) * 0.213) - (sin(value) * 0.787),
      (0.715) - (cos(value) * 0.715) + (sin(value) * 0.715),
      (0.072) + (cos(value) * 0.928) + (sin(value) * 0.072),
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }

  /// A matrix with a the [random] filter.
  static ColorFilter get random {
    var randomItem = [0.0, 1.0, 0.0];
    return ColorFilter.matrix(<double>[
      randomItem[_random],
      randomItem[_random],
      randomItem[_random],
      0,
      0,
      randomItem[_random],
      randomItem[_random],
      randomItem[_random],
      0,
      0,
      randomItem[_random],
      randomItem[_random],
      randomItem[_random],
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);
  }
}
