import 'package:flutter/material.dart';
import 'package:girlzwhosell/model/filter_chip_model.dart';

class FilterChips {
  static final all = <FilterChipData>[
    FilterChipData(
      label: 'Price: Low To High',
      isSelected: false,
      color: Colors.green,
    ),
    FilterChipData(
      label: 'Price: High To Low',
      isSelected: false,
      color: Colors.red,
    ),
    FilterChipData(
      label: 'Get By Tomorrow',
      isSelected: false,
      color: Colors.blue,
    ),
    FilterChipData(
      label: 'Avg. Customer Review',
      isSelected: false,
      color: Colors.orange,
    ),
    FilterChipData(
      label: 'Sort By Relevance',
      isSelected: false,
      color: Colors.purple,
    ),
  ];
}