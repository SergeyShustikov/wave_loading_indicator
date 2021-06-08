# The wave loading indicator

>A customable wave progress widget


## Preview

<img src="https://github.com/SergeyShustikov/wave_loading_indicator/blob/master/art/example_1.gif?raw=true" width="340px" />
<img src="https://github.com/SergeyShustikov/wave_loading_indicator/blob/master/art/example_2.gif?raw=true" width="340px" />

# How to use
 1. Add this to your package's pubspec.yaml file:

````dart
dependencies:
  wave_loading_indicator: ^1.0.7
  ````
  
 2. Add this import to your dart file:

````dart
import 'package:wave_loading_indicator/wave_progress.dart';
  ````

 3. Just add WaveProgress wherever you want!
 you can customise it's border and fill color too!
 
 ````dart
WaveProgress(
          borderSize: 3.0, 
          size: 180, 
          borderColor: Colors.redAccent,
          foregroundWaveColor: Colors.greenAccent,
          backgroundWaveColor: Colors.blueAccent,
          progress: _progress, // [0-100]
          innerPadding: 10, // padding between border and waves
),
  ````
 
## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
