part of on_image_matrix;

/// A controller to [on_image_matrix] package.
class OnImageController extends ChangeNotifier {
  ///
  Uint8List? _tmpImageBytes;

  /// If you call this method after using [saveBytes] will return the widget as
  /// a image(bytes). If you call before using [saveBytes] will return null.
  Uint8List? get imageBytes => _tmpImageBytes;

  /// This method will 'delete' the current image(bytes).
  void clearBytes() => _tmpImageBytes = null;

  /// This method will 'save' the current widget as a image(bytes).
  ///
  /// Use [imageBytes] to get this image.
  void saveBytes() => notifyListeners();
}
