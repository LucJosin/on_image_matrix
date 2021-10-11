import 'package:flutter/material.dart';
import 'package:on_image_matrix/on_image_matrix.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ScrollController _scrollController = ScrollController();
  final snackBar = const SnackBar(
    content: Text('Reset before adding a custom editting!'),
  );
  double brightnessAndContrast = 0.0;
  double exposure = 0.0;
  double saturation = 1.0;
  double visibility = 1.0;

  int currentFilter = -1;

  List<ColorFilter> filters = [
    OnImageFilters.normal,
    OnImageFilters.blueSky,
    OnImageFilters.gray,
    OnImageFilters.grayHighBrightness,
    OnImageFilters.grayHighExposure,
    OnImageFilters.grayLowBrightness,
    OnImageFilters.hueRotateWith2,
    OnImageFilters.invert,
    OnImageFilters.kodachrome,
    OnImageFilters.protanomaly,
    OnImageFilters.random,
    OnImageFilters.sepia,
    OnImageFilters.sepium,
    OnImageFilters.technicolor,
    OnImageFilters.vintage,
  ];

  List<String> filtersNames = [
    'normal',
    'blueSky',
    'gray',
    'grayHighBrightness',
    'grayHighExposure',
    'grayLowBrightness',
    'hueRotateWith2',
    'invert',
    'kodachrome',
    'protanomaly',
    'random',
    'sepia',
    'sepium',
    'technicolor',
    'vintage',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OnImageMatrixExample'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                currentFilter = -1;
                brightnessAndContrast = 0.0;
                exposure = 0.0;
                saturation = 1.0;
                visibility = 1.0;
              });
              const resetSnackBar = SnackBar(
                content: Text('Done!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(resetSnackBar);
            },
            icon: const Icon(Icons.restore_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OnImageMatrixWidget(
              colorFilter: currentFilter == -1
                  ? OnImageMatrix.matrix(
                      brightnessAndContrast: brightnessAndContrast,
                      exposure: exposure,
                      saturation: saturation,
                      visibility: visibility,
                    )
                  : filters[currentFilter],
              child: Image.network(
                'https://source.unsplash.com/j0QOYiYwIYE/1600x900',
                loadingBuilder: (_, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            const Divider(),
            Text('brightnessAndContrast - [$brightnessAndContrast]'),
            Slider(
              max: 5.0,
              min: -5.0,
              value: brightnessAndContrast,
              onChangeEnd: (endValue) {
                if (currentFilter >= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              onChanged: (brightnessAndContrast) {
                if (currentFilter == -1) {
                  setState(() {
                    this.brightnessAndContrast = brightnessAndContrast;
                  });
                }
              },
            ),
            const Divider(),
            Text('exposure - [$exposure]'),
            Slider(
              max: 5.0,
              min: 0.0,
              value: exposure,
              onChangeEnd: (endValue) {
                if (currentFilter >= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              onChanged: (exposure) {
                if (currentFilter == -1) {
                  setState(() {
                    this.exposure = exposure;
                  });
                }
              },
            ),
            const Divider(),
            Text('saturation - [$saturation]'),
            Slider(
              max: 5.0,
              min: 1.0,
              value: saturation,
              onChangeEnd: (endValue) {
                if (currentFilter >= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              onChanged: (saturation) {
                if (currentFilter == -1) {
                  setState(() {
                    this.saturation = saturation;
                  });
                }
              },
            ),
            const Divider(),
            Text('visibility - [$visibility]'),
            Slider(
              max: 1.0,
              min: 0.0,
              value: visibility,
              onChangeEnd: (endValue) {
                if (currentFilter >= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              onChanged: (visibility) {
                if (currentFilter == -1) {
                  setState(() {
                    this.visibility = visibility;
                  });
                }
              },
            ),
            const Divider(),
            const Text('Filters'),
            Flexible(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (_, index) {
                  return RadioListTile<int>(
                    value: currentFilter,
                    groupValue: index,
                    onChanged: (newFilter) async {
                      await _scrollController.animateTo(
                        0.0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                      setState(() {
                        currentFilter = index;
                      });
                    },
                    title: Text(filtersNames[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
