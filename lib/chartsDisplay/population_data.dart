import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';


class PopulationData {
  int year;
  int population;
  charts.Color barColor;
  PopulationData({
    @required this.year, 
    @required this.population,
    @required this.barColor
  });
}