part of on_image_matrix;

/// Method where you can control specifics or all image/widget edit
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
class OnImageMatrix extends ColorFilter {
  /// Some default values.
  static double get _rwgt => 0.3086;
  static double get _gwgt => 0.6094;
  static double get _bwgt => 0.0820;

  /// Construct a color filter that transforms a color by a 5x5 matrix, where
  /// the fifth row is implicitly added in an identity configuration.
  ///
  /// Every pixel's color value, repsented as an `[R, G, B, A]`, is matrix
  /// multiplied to create a new color:
  ///
  /// ```text
  /// | R' |   | a00 a01 a02 a03 a04 |   | R |
  /// | G' |   | a10 a11 a22 a33 a44 |   | G |
  /// | B' | = | a20 a21 a22 a33 a44 | * | B |
  /// | A' |   | a30 a31 a22 a33 a44 |   | A |
  /// | 1  |   |  0   0   0   0   1  |   | 1 |
  /// ```
  ///
  /// The matrix is in row-major order and the translation column is specified
  /// in unnormalized, 0...255, space. For example, the identity matrix is:
  ///
  /// ```
  /// const ColorFilter identity = ColorFilter.matrix(<double>[
  ///   1, 0, 0, 0, 0,
  ///   0, 1, 0, 0, 0,
  ///   0, 0, 1, 0, 0,
  ///   0, 0, 0, 1, 0,
  /// ]);
  /// ```
  ///
  /// `From ColorFilter.matrix`
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
  OnImageMatrix.custom(List<double> matrix) : super.matrix(matrix);

  /// Matrix that let you control the [brightnessAndContrast], [exposure], [saturation] and
  /// [visibility] at the same time.
  OnImageMatrix.matrix({
    double brightnessAndContrast = 0.0,
    double exposure = 0.0,
    double saturation = 1.0,
    double visibility = 1.0,
  }) : super.matrix([
          exposure + (1.0 - saturation) * _rwgt + saturation, // RR
          (1.0 - saturation) * _gwgt, // RG
          (1.0 - saturation) * _bwgt, // RB
          0.0, // RA
          brightnessAndContrast * 10, // R-OFFSET
          //
          (1.0 - saturation) * _rwgt, // GR
          exposure + (1.0 - saturation) * _gwgt + saturation, // GG
          (1.0 - saturation) * _bwgt, // GB
          0.0, // GA
          brightnessAndContrast * 10, // G-OFFSET
          //
          (1.0 - saturation) * _rwgt, // BR
          exposure + (1.0 - saturation) * _gwgt, // BG
          (1.0 - saturation) * _bwgt + saturation, // BB
          0.0, // BA
          brightnessAndContrast * 10, // B-OFFSET
          //
          0.0, // AR
          0.0, // AG
          0.0, // AB
          visibility, // AA
          0.0, // A-OFFSET
        ]);

  /// Matrix to control only [brightnessAndContrast].
  OnImageMatrix.brightness([double brightness = 0.0])
      : super.matrix([
          1.0, // RR
          0.0, // RG
          0.0, // RB
          0.0, // RA
          brightness * 10, // R-OFFSET
          //
          0.0, // GR
          1.0, // GG
          0.0, // GB
          0.0, // GA
          brightness * 10, // G-OFFSET
          //
          0.0, // BR
          0.0, // BG
          1.0, // BB
          0.0, // BA
          brightness * 10, // B-OFFSET
          //
          0.0, // AR
          0.0, // AG
          0.0, // AB
          1.0, // AA
          0.0, // A-OFFSET
        ]);

  /// Matrix to control only [hue].
  OnImageMatrix.hue([double hue = 0.0])
      : super.matrix([
          (0.213) + (cos(hue) * 0.787) - (sin(hue) * 0.213), // RR
          (0.715) - (cos(hue) * 0.715) - (sin(hue) * 0.715), // RG
          (0.072) - (cos(hue) * 0.072) + (sin(hue) * 0.928), // RB
          0.0, // RA
          0.0, // R-OFFSET
          //
          (0.213) - (cos(hue) * 0.213) + (sin(hue) * 0.143), // GR
          (0.715) + (cos(hue) * 0.285) + (sin(hue) * 0.140), // GG
          (0.072) - (cos(hue) * 0.072) - (sin(hue) * 0.283), // GB
          0.0, // GA
          0.0, // G-OFFSET
          //
          (0.213) - (cos(hue) * 0.213) - (sin(hue) * 0.787), // BR
          (0.715) - (cos(hue) * 0.715) + (sin(hue) * 0.715), // BG
          (0.072) + (cos(hue) * 0.928) + (sin(hue) * 0.072), // BB
          0.0, // BA
          0.0, // B-OFFSET
          //
          0.0, // AR
          0.0, // AG
          0.0, // AB
          1.0, // AA
          0.0, // A-OFFSET
        ]);

  /// Matrix to control only [exposure].
  OnImageMatrix.exposure([double exposure = 1.0])
      : super.matrix([
          exposure, // RR
          0.0, // RG
          0.0, // RB
          0.0, // RA
          0.0, // R-OFFSET
          //
          0.0, // GR
          exposure, // GG
          0.0, // GB
          0.0, // GA
          0.0, // G-OFFSET
          //
          0.0, // BR
          0.0, // BG
          exposure, // BB
          0.0, // BA
          0.0, // B-OFFSET
          //
          0.0, // AR
          0.0, // AG
          0.0, // AB
          1.0, // AA
          0.0, // A-OFFSET
        ]);

  /// Matrix to control only [saturation].
  OnImageMatrix.saturation([double saturation = 1.0])
      : super.matrix([
          (1.0 - saturation) * _rwgt + saturation, // RR
          (1.0 - saturation) * _gwgt, // RG
          (1.0 - saturation) * _bwgt, // RB
          0.0, // RA
          0.0, // R-OFFSET
          //
          (1.0 - saturation) * _rwgt, // GR
          (1.0 - saturation) * _gwgt + saturation, // GG
          (1.0 - saturation) * _bwgt, // GB
          0.0, // GA
          0.0, // G-OFFSET
          //
          (1.0 - saturation) * _rwgt, // BR
          (1.0 - saturation) * _gwgt, // BG
          (1.0 - saturation) * _bwgt + saturation, // BB
          0.0, // BA
          0.0, // B-OFFSET
          //
          0.0, // AR
          0.0, // AG
          0.0, // AB
          1.0, // AA
          0.0, // A-OFFSET
        ]);
}
