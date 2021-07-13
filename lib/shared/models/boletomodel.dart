import 'dart:convert';

import 'package:flutter/material.dart';

class BoletoModel {
  final String primaryKey;
  final String? name;
  final String? dueDate;
  final double? value;
  final String? barcode;

  BoletoModel({
    required this.primaryKey,
    this.name,
    this.dueDate,
    this.value,
    this.barcode,
  });

  static String generateKey() => UniqueKey().hashCode.toString();

  BoletoModel copyWith({
    String? name,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return BoletoModel(
      primaryKey: generateKey(),
      name: name ?? this.name,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryKey': primaryKey,
      'name': name,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory BoletoModel.fromMap(Map<String, dynamic> map) {
    return BoletoModel(
      primaryKey: map['primaryKey'],
      name: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BoletoModel.fromJson(String source) =>
      BoletoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BoletoModel(name: $name, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BoletoModel &&
        other.name == name &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return primaryKey.hashCode ^
        name.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        barcode.hashCode;
  }
}
