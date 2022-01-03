// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_field

import 'package:flutter/material.dart';

// TODO: Check if we need to import anything
import 'package:unit_convert_app/category.dart';

// TODO: Define any constants
const iconLocation = Icons.cake;
const _numberOfItem = 8;

/// Category Route (screen).
///
/// This is the 'home' screen of the Unit Converter. It shows a header and
/// a list of [Categories].
///
/// While it is named CategoryRoute, a more apt name would be CategoryScreen,
/// because it is responsible for the UI at the route's destination.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute({Key? key}) : super(key: key);

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <ColorSwatch>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Create a list of the eight Categories, using the names and colors
    // from above. Use a placeholder icon, such as `Icons.cake` for each
    // Category. We'll add custom icons later.
    // final lenght = Category(name: name, color: color, iconLocation: iconLocation)
    final _listCategory = <Category>[
      Category(
          name: _categoryNames[0],
          color: _baseColors[0],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[1],
          color: _baseColors[1],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[2],
          color: _baseColors[2],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[3],
          color: _baseColors[3],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[4],
          color: _baseColors[4],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[5],
          color: _baseColors[5],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[6],
          color: _baseColors[6],
          iconLocation: iconLocation),
      Category(
          name: _categoryNames[7],
          color: _baseColors[7],
          iconLocation: iconLocation),
    ];

    // TODO: Create a list view of the Categories
    final listView = ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _numberOfItem,
        itemBuilder: (BuildContext context, int index) {
          return Category(name: _categoryNames[index],
              color: _baseColors[index],
              iconLocation: iconLocation);
        });

    // TODO: Create an App Bar
    final appBar = AppBar(
      title: const Text(
        'Unit Converter',
        style: TextStyle(fontSize: 30),
      ),
      elevation: 0.0,
      backgroundColor: Colors.green[100],
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
      backgroundColor: Colors.green[100],
    );
  }
}
