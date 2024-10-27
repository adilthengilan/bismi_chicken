import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DashProvider extends ChangeNotifier {
  int navigationindex = 0;
  bool colorvalue = false;
  List<Color> colors = [];
  List<dynamic> farms = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3];
  List listedcolours = [];

  void colorslegth() {
    List<int> colourslength = List.generate(farms.length, (index) => index + 1);
    listedcolours = colourslength;
    notifyListeners();
  }

  void setNavigationIndex(index) {
    navigationindex = index;
    notifyListeners();
  }

  void colorPicking() {
    if (colorvalue == false) {
      getRandomColor();
      colorvalue = true;
      notifyListeners();
    } else {
      return;
    }
  }

  Color getRandomColor() {
    colorvalue = true;
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
      1, // Opacity
    );
  }

  Future<void> saveColors() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> colorStrings =
        colors.map((color) => color.value.toRadixString(16)).toList();
    print(colorStrings);
    await prefs.setStringList('colorkey', colorStrings);
    print(colorStrings);
  }

  Future<List<Color>> getColors(int count) async {
    print(
        '=========hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? colorStrings = prefs.getStringList('colorkey');
    print('${colorStrings}===================');
    // If colors are saved, convert them back to Color objects; else generate new colors
    if (colorStrings != null && colorStrings.isNotEmpty) {
      return colorStrings
          .map((hex) => Color(int.parse(hex, radix: 16)))
          .toList();
    } else {
      List<Color> newColors = generateRandomColors(count);
      colors = newColors;
      notifyListeners();
      await saveColors(); // Save generated colors for future use
      return newColors;
    }
  }
  // Future<List<Color>> getColors(int count) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? colorStrings = prefs.getStringList('colorKey');
  //   return colorStrings.map((hex) => Color(int.parse(hex, radix: 16))).toList();

  //   // If colors exist in storage, return them; otherwise, generate new colors
  //   // if (colorStrings != null && colorStrings.isNotEmpty) {
  //   // } else {
  //   //   List<Color> ncolors = List.generate(count, (_) => getRandomColor());
  //   //   return ncolors;
  //   // }
  // }

  Future<void> loadColors() async {
    // colors = await getColors(farms.length);
    if (colors.isEmpty) {
      colors = generateRandomColors(farms.length);
      saveColors();

      getColors(farms.length);
    } else {
      getColors(farms.length);
    }
    notifyListeners();
  }

  List<Color> generateRandomColors(int count) {
    Random random = Random();
    return List<Color>.generate(count, (index) {
      return Color.fromARGB(
        255, // Full opacity
        random.nextInt(256), // Red value
        random.nextInt(256), // Green value
        random.nextInt(256), // Blue value
      );
    });
  }
}
