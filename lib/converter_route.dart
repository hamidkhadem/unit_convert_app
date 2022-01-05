// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'unit.dart';

const _padding = EdgeInsets.all(16.0 * 2);

/// [ConverterRoute] where users can input amounts to convert in one [Unit]
/// and retrieve the conversion in another [Unit] for a specific [Category].
///
/// While it is named ConverterRoute, a more apt name would be ConverterScreen,
/// because it is responsible for the UI at the route's destination.
class ConverterRoute extends StatefulWidget {
  /// Color for this [Category].
  final Color color;

  /// Units for this [Category].
  final List<Unit> units;

  /// This [ConverterRoute] requires the color and units to not be null.
  const ConverterRoute({
    required this.color,
    required this.units,
    Key? key,
  }) : super(key: key);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  // TODO: Set some variables, such as for keeping track of the user's input
  // value and units
  double? _value;
  String? _dropdwounUnit;

  @override
  void initState() {
    _dropdwounUnit = widget.units.first.name;
  } // TODO: Determine whether you need to override anything, such as initState()

  // TODO: Add other helper functions. We've given you one, _format()

  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create the 'input' group of widgets. This is a Column that
    // includes the input value, and 'from' unit [Dropdown].
    final input = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            // style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                labelText: 'Input',
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: "Input Invalid text!!"),
          ),
          DropdownButtonFormField(
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              value: _dropdwounUnit,
              items: widget.units.map<DropdownMenuItem<String>>((Unit unit) {
                return DropdownMenuItem<String>(
                  child: Text(unit.name!),
                  value: unit.name,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdwounUnit = newValue!;
                });
              })
        ],
      ),
    );

    // TODO: Create a compare arrows icon.
    const compareArrows = Icon(
      Icons.import_export_rounded,
      size: 40.0,
    );

    // TODO: Create the 'output' group of widgets. This is a Column that
    // includes the output value, and 'to' unit [Dropdown].
    final output = Padding(
      padding: _padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            enabled: false,
            // style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                labelText: _format(widget.units.first.conversion!),
                labelStyle: Theme.of(context).textTheme.headline6,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                errorText: "Input Invalid text!!"),
          ),
          DropdownButtonFormField(
              style: Theme.of(context).textTheme.headline5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              value: _dropdwounUnit,
              items: widget.units.map<DropdownMenuItem<String>>((Unit unit) {
                return DropdownMenuItem<String>(
                  child: Text(unit.name!),
                  value: unit.name,
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _dropdwounUnit = newValue!;
                });
              })
        ],
      ),
    );

    // TODO: Return the input, arrows, and output widgets, wrapped in a Column.
    return Column(
      children: [
        input,
        compareArrows,
        output,
      ],
    );

    // TODO: Delete the below placeholder code.
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        color: widget.color,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name!,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();

    /*return ListView(
      children: unitWidgets,
    );*/
    return input;
  }
}
