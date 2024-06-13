import 'package:flutter/material.dart';
import 'package:search_filter/Constants/colors.dart';
import 'package:search_filter/Models/cars_mod.dart';
import 'package:search_filter/utils/texts.dart';

class CardTile extends StatefulWidget {
  final CarsModel data;
  const CardTile({super.key, required this.data});

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends State<CardTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.containerColor,
      ),
      child: ListTile(
        title: Text(
          widget.data.model,
          style: med16Mont,
        ),
        subtitle: Text(
          widget.data.make,
          style: regular14Mont,
        ),
      ),
    );
  }
}
