part of on_image_matrix;

/// This widget will make everything more easy to edit basics information of a image
/// using native matrix you'll be able to control the brightness, exposure, contrast,
/// saturation, etc.. of a image(or a widget), apply filter and convert this widget
/// into a image(bytes).
///
/// **This package isn't focused on professional image(widget) editting.**
///
/// All edit use native code(matrix) and widget(ColorFiltered and ImageFiltered).
///
/// Examples:
///
/// **Editting only one matrix:**
///
/// ```dart
/// body: OnImageMatrixWidget(
///   colorFilter: OnImageMatrix.brightness(3.0),
///   child: Image.network(
///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
///   ),
/// ),
/// ```
///
/// **Applying a filter:**
///
/// ```dart
/// body: OnImageMatrixWidget(
///   colorFilter: OnImageFilters.gray1,
///   child: Image.network(
///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
///   ),
/// ),
/// ```
///
/// **Editting mutiples matrices:**
///
/// ```dart
/// body: OnImageMatrixWidget(
///   colorFilter: OnImageMatrix.matrix(
///     brightnessAndContrast: 5.0,
///     exposure: 1.0,
///     saturation: 2.0,
///     visibility: 1.0,
///   ),
///   child: Image.network(
///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
///   ),
/// ),
/// ```
///
/// Using the [OnImageMatrixWidget] you won't be able to 'get' this widget and convert
/// into a image. To achieve this you will use the [OnImageMatrixWidget.builder].
///
/// Example:
///
/// ```dart
/// body: OnImageMatrixWidget.builder(
///   controller: _controller, // required
///   imageKey: _globalKey, // required
///   colorFilter: OnImageMatrix.matrix(
///     brightnessAndContrast: 0.0,
///     exposure: 0.0,
///     saturation: 1.0,
///     visibility: 1.0,
///   ),
///   child: Image.network(
///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
///   ),
/// ),
/// ```
///
/// To save this widget into a image(bytes) use the [controller]
///
/// ```dart
/// onTap: () {
///   controller.save();
/// }
/// ```
///
/// To get the bytes:
///
/// ```dart
/// onTap: () {
///   Uint8List imageBytes = controller.imageBytes;
/// }
/// ```
class OnImageMatrixWidget extends StatefulWidget {
  /// [child] is the Widget that will be applyed the filter.
  ///
  /// Important:
  ///
  /// * [child] can't be null. Cannot provide a filter without a widget.
  final Widget child;

  /// [blur] is the value of how many blur needs to be applyed into the [child] widget.
  ///
  /// Important:
  ///
  /// * If [blur] is null, will be set to [0.0].
  final double? blur;

  /// [blurMode] is the mode of how the blur will be applyed into the [child] widget.
  ///
  /// Important:
  ///
  /// * If [blurMode] is null, will be set to [decal].
  final TileMode? blurMode;

  /// [colorFilter] is the filter that will be applyed to the [child] widget.
  ///
  /// You can use the native [ColorFilter] or the package [OnImageFilters] with
  /// some default values:
  ///
  /// * normal
  /// * gray1
  /// * gray2
  /// * grayHighContrast
  /// * grayLowContrast
  /// * invert
  /// * sepia
  /// * sepium
  /// * protanomaly
  /// * technicolor
  /// * blueSky
  /// * kodachrome
  /// * vintage
  /// * hueRotateWith2
  /// * random
  ///
  /// Example:
  ///
  /// ```dart
  ///   // ...
  ///   colorFilter: OnImageFilters.normal,
  ///   // or
  ///   colorFilter: OnImageFilters.gray1,
  ///   // ...
  /// ```
  ///
  /// For change some basics parameters like: brightness, contrast, exposure, etc..
  /// use the [OnImageMatrix]:
  ///
  /// Example:
  ///
  /// ```dart
  ///   // ...
  ///   colorFilter: OnImageMatrix.brightness(2.0),
  ///   // or
  ///   colorFilter: OnImageMatrix.saturation(3.0),
  ///   // ...
  /// ```
  ///
  /// You can also, use all of this methods at the same time to create a beautiful image:
  ///
  /// Example:
  ///
  /// ```dart
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: 0.0,
  ///     exposure: 0.0,
  ///     saturation: 1.0,
  ///     visibility: 1.0,
  ///   ),
  /// ```
  ///
  /// Important:
  ///
  /// * When using [OnImageMatrix.matrix], the [brightness] and [contrast] values are
  /// placed on the same parameter so, if [brightnessAndContrast] is greater than 0.0,
  /// will be setted [brightness] and if [brightnessAndContrast] is less than 0.0,
  /// will be setted [contrast].
  ///
  /// Example:
  ///
  /// ```dart
  ///   // Brightness
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: 2.0,
  ///   ),
  ///
  ///   // Contrast
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: -2.0,
  ///   ),
  /// ```
  final ColorFilter? colorFilter;

  /// This widget will make everything more easy to edit basics information of a image
  /// using native matrix you'll be able to control the brightness, exposure, contrast,
  /// saturation, etc.. of a image(or a widget), apply filter and convert this widget
  /// into a image(bytes).
  ///
  /// **This package isn't focused on professional image(widget) editting.**
  ///
  /// All edit use native code(matrix) and widget(ColorFiltered and ImageFiltered).
  ///
  /// Examples:
  ///
  /// **Editting only one matrix:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageMatrix.brightness(3.0),
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// **Applying a filter:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageFilters.gray1,
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// **Editting mutiples matrices:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: 5.0,
  ///     exposure: 1.0,
  ///     saturation: 2.0,
  ///     visibility: 1.0,
  ///   ),
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  const OnImageMatrixWidget({
    Key? key,
    required this.child,
    this.blur,
    this.blurMode,
    this.colorFilter,
  })  : visible = true,
        imageKey = null,
        imageFormat = null,
        controller = null,
        super(key: key);

  /// This widget will make everything more easy to edit basics information of a image
  /// using native matrix you'll be able to control the brightness, exposure, contrast,
  /// saturation, etc.. of a image(or a widget), apply filter and convert this widget
  /// into a image(bytes).
  ///
  /// **This package isn't focused on professional image(widget) editting.**
  ///
  /// All edit use native code(matrix) and widget(ColorFiltered and ImageFiltered).
  ///
  /// Examples:
  ///
  /// **Editting only one matrix:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageMatrix.brightness(3.0),
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// **Applying a filter:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageFilters.gray1,
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// **Editting mutiples matrices:**
  ///
  /// ```dart
  /// body: OnImageMatrixWidget(
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: 5.0,
  ///     exposure: 1.0,
  ///     saturation: 2.0,
  ///     visibility: 1.0,
  ///   ),
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// Using the [OnImageMatrixWidget] you won't be able to 'get' this widget and convert
  /// into a image. To achieve this you will use the [OnImageMatrixWidget.builder].
  ///
  /// Example:
  ///
  /// ```dart
  /// body: OnImageMatrixWidget.builder(
  ///   controller: _controller, // required
  ///   imageKey: _globalKey, // required
  ///   colorFilter: OnImageMatrix.matrix(
  ///     brightnessAndContrast: 0.0,
  ///     exposure: 0.0,
  ///     saturation: 1.0,
  ///     visibility: 1.0,
  ///   ),
  ///   child: Image.network(
  ///     'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ///   ),
  /// ),
  /// ```
  ///
  /// To save this widget into a image(bytes) use the [controller]
  ///
  /// ```dart
  /// onTap: () {
  ///   controller.save();
  /// }
  /// ```
  ///
  /// To get the bytes:
  ///
  /// ```dart
  /// onTap: () {
  ///   Uint8List imageBytes = controller.imageBytes;
  /// }
  /// ```
  const OnImageMatrixWidget.builder({
    Key? key,
    required this.controller,
    required this.imageKey,
    required this.child,
    this.imageFormat,
    this.blur,
    this.blurMode,
    this.colorFilter,
    this.visible = true,
  })  : assert(
            controller != null,
            'The [controller] cannot be null when using the [builder].\n'
            'Define the [controller] parameter.'),
        assert(
            imageKey != null,
            'The [imageKey] cannot be null when using the [builder].\n'
            'Define the [imageKey] parameter.'),
        super(key: key);

  /// [visible] is used to control when the [child] widget will be visible or not..
  ///
  /// Important:
  ///
  /// * [visible] is [true] as default.
  /// * This parameter will only be avalible when using [OnImageMatrixWidget.builder].
  final bool visible;

  /// [controller] is used to call anytime and anywhere the 'save' method.
  ///
  /// When calling [saveBytes], all filters applyed to the [OnImageMatrixWidget]
  /// will be converted into a image in [Uint8List]. To get this bytes call [imageBytes]
  /// using the [controller].
  ///
  /// Example:
  ///
  /// ```dart
  /// onTap: () {
  ///   controller.save();
  /// }
  /// ```
  ///
  /// To get the bytes:
  ///
  /// ```dart
  /// onTap: () {
  ///   Uint8List imageBytes = controller.imageBytes;
  /// }
  /// ```
  ///
  /// Important:
  ///
  /// * [controller] cannot be null.
  /// * This parameter will only be avalible when using [OnImageMatrixWidget.builder].
  final OnImageController? controller;

  /// [imageFormat] is used when calling [saveBytes] from [OnImageController].
  ///
  /// Types:
  ///
  /// * [png]
  /// * [rawRgba]
  /// * [rawUnmodified]
  ///
  /// Important:
  ///
  /// * [imageFormat] is [rawRgba] as default.
  /// * This parameter will only be avalible when using [OnImageMatrixWidget.builder].
  final ui.ImageByteFormat? imageFormat;

  /// [imageKey] is used to identify the widget when calling [saveBytes] from [OnImageController].
  ///
  /// Important:
  ///
  /// * [imageKey] cannot be null. If so, will throw a exception.
  /// * This parameter will only be avalible when using [OnImageMatrixWidget.builder].
  final GlobalKey? imageKey;

  @override
  _OnImageMatrixWidgetState createState() => _OnImageMatrixWidgetState();
}

class _OnImageMatrixWidgetState extends State<OnImageMatrixWidget> {
  /// Default image filter: [normal]
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
  ColorFilter get _defaultFilter => OnImageFilters.normal;

  /// Default image format: [rawRgba]
  ///
  /// This value will be used when using [saveBytes]
  ui.ImageByteFormat get _defaultFormat => ui.ImageByteFormat.rawRgba;

  @override
  void initState() {
    super.initState();
    // Listen to the image controller.
    widget.controller?.addListener(() {
      _save();
    });
  }

  // Here we'll convert a widget into a image.
  void _save() async {
    // We cannot convert a widget without a key.
    if (widget.imageKey == null) {
      throw Exception(
          'Cannot convert the widget into bytes without this [key] value.\n'
          'Define a value to the [key] parameter.');
    }

    // To avoid problems, 'delete' the old image bytes.
    widget.controller?._tmpImageBytes = null;

    // Get the widget render.
    final repaintBoundary = widget.imageKey!.currentContext?.findRenderObject()
        as RenderRepaintBoundary;

    //
    if (repaintBoundary.debugNeedsPaint) {
      await Future.delayed(const Duration(milliseconds: 20));
      return _save();
    }

    //
    ui.Image boxImage = await repaintBoundary.toImage();
    ByteData? byteData = await boxImage.toByteData(
      // If imageFormat is null, use the default: [rawRgba]
      format: widget.imageFormat ?? _defaultFormat,
    );

    // Get the image bytes.
    widget.controller?._tmpImageBytes = byteData!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    // The 'RepaintBoundary' will 'paint' one widget before so, we need add a
    // 'invisible' widget. This can be anything, [SizedBox], [Center], etc...
    return Visibility(
      visible: widget.visible,
      // With this widget we'll be able to convert everything after in a image.
      child: RepaintBoundary(
        // We use the [key] to 'find' the specific widget.
        key: widget.imageKey,
        // All effects.
        child: ColorFiltered(
          colorFilter: widget.colorFilter ?? _defaultFilter,
          child: ImageFiltered(
            imageFilter: ui.ImageFilter.blur(
              sigmaY: widget.blur ?? 0.0,
              sigmaX: widget.blur ?? 0.0,
              tileMode: widget.blurMode ?? TileMode.decal,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the listener.
    widget.controller?.dispose();
    super.dispose();
  }
}
