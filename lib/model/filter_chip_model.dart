import 'package:flutter/material.dart';

class FilterChipData {
  String id;
   String label;
  String description;
   Color color;
   bool isSelected;

   FilterChipData({
    @required this.label,
    @required this.color,
    this.isSelected = false,
  });

  FilterChipData copy({
    String label,
    Color color,
    bool isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        color: color ?? this.color,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FilterChipData &&
              runtimeType == other.runtimeType &&
              label == other.label &&
              color == other.color &&
              isSelected == other.isSelected;

  FilterChipData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.label;
    data['description'] = this.description;
    return data;
  }




  @override
  int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;




}