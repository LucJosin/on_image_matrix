# on_image_matrix
[![Pub.dev](https://img.shields.io/pub/v/on_image_matrix?color=9cf&label=Pub.dev&style=flat-square)](https://pub.dev/packages/on_image_matrix)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20IOS%20%7C%20Web%20%7C%20MacOs%20%7C%20Linux%20%7C%20Windows-9cf?&style=flat-square)](https://www.android.com/)
[![Flutter](https://img.shields.io/badge/Language-Flutter%20%7C%20Null--Safety-9cf?logo=flutter&style=flat-square)](https://www.flutter.dev/)

`on_image_matrix` é um [Flutter](https://flutter.dev/) Package usado para 'editar' básicos aspectos [Brilho, Contraste, Saturação, etc...] de um widget ou imagem. Usando `OnImageFilters` você pode usar alguns filtros já definidos. <br>

## Help:

**Algum problema? [Issues](https://github.com/LucJosin/on_image_matrix/issues)** <br>
**Alguma sugestão? [Pull request](https://github.com/LucJosin/on_image_matrix/pulls)**

### Translations:

NOTE: Fique à vontade para ajudar nas traduções

* [English](README.md)
* [Portuguese](README.pt-BR.md)

### Topics:

* [Como instalar](#how-to-install)
* [Como usar](#how-to-use)
* [Exemplos](#examples)
* [Color Matrix](#color-matrix)
* [Licença](#license)

## How to Install:
Adicione o seguinte codigo para seu `pubspec.yaml`:
```yaml
dependencies:
  on_image_matrix: ^1.0.0+1
```

## TODO:

* Adicionar `[Qualidades]`.
* Arrumar erros.

## How to use:

```dart
OnImageMatrixWidget() // O comando principal para usar o package.
```
Todos os tipos de métodos nesse package:

|  Parameters  |   Arguments   |   Description   |
|--------------|-----------------|-----------------|
| `blur` | `double?` | `Used to define the postion of effect based effectType.` | <br>
| `blurMode` | `TileMode?` | `Used to define the postion of effect based effectType.` | <br>
| `colorFilter` | `ColorFilter?` | `Used to define the postion of effect based effectType.` | <br>

Para ser capaz de salvar esse widget como uma imagem, use o builder.

```dart
OnImageMatrixWidget.builder() // O comando principal para usar o package.
```
Todos os tipos de métodos nesse package:

|  Parameters  |   Arguments   |   Description   |
|--------------|-----------------|-----------------|
| `blur` | `double?` | `Used to apply a blur effect on the widget/image.` | <br>
| `blurMode` | `TileMode?` | `Used to define the blur mode.` | <br>
| `colorFilter` | `ColorFilter?` | `Used to define/apply the effect or filter.` | <br>
| `controller` | `Widget` | `Used to save, delete or get the widget bytes as image` | <br>
| `imageKey` | `Widget` | `Used to find the widget and convert into image` | <br>
| `imageFormat` | `double?` | `Used to define format of widget when converting to a image .` | <br>

## Example:

#### OnImageMatrixWidget
```dart
OnImageMatrixWidget.builder(
  controller: _controller,
  imageKey: GlobalKey(),
  blur: 2.0,
  blurMode: TileMode.decal,
  // Você pode usar alguns filtros já definidos
  colorFilter: OnImageFilters.gray,
  // Modificar usando seu estilo
  // colorFilter: OnImageMatrix.matrix(
  //   brightnessAndContrast: 0.0,
  //   exposure: 0.0,
  //   saturation: 1.0,
  //   visibility: 1.0,
  // ),
  // Ou criar seu próprio filtro usando color matrix.
  // OnImageMatrix.custom([
  //  1, 0, 0, 0, 0,
  //  0, 1, 0, 0, 0,
  //  0, 0, 1, 0, 0,
  //  0, 0, 0, 1, 0,
  // ])
  imageFormat: ImageByteFormat.rawRgba,
  child: Image.network(
  'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
  ),
),
```

Depois de modificar seu widget/imagem use o [OnImageController] para salvar.

```dart
  OnImageController _imageController = OnImageController();

  Uint8List? saveImage() {
    _imageController.save();
    return _imageController.imageBytes;
  }
```

## Color Matrix
Tente você mesmo:

* [SVG Color Matrix Mixer](https://fecolormatrix.com/)
* [SVG Color Filter Playground](https://kazzkiq.github.io/svg-color-filter/)

Veja mais:

* [rn-color-matrices](https://github.com/iyegoroff/rn-color-matrices/blob/master/index.ts)
* [finessing-fecolormatrix](https://alistapart.com/article/finessing-fecolormatrix/)
* [colormatrix-guide](https://docs.rainmeter.net/tips/colormatrix-guide/)
* [image-filters-in-flutter](https://retroportalstudio.medium.com/image-filters-in-flutter-no-package-required-6f8cb57ba0b)

## LICENSE:

* [LICENSE](https://github.com/LucJosin/on_image_matrix/blob/main/LICENSE)

> * [Back to top](#on_image_matrix)
