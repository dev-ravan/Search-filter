import 'package:flutter/material.dart';
import 'package:search_filter/Components/card_tile.dart';
import 'package:search_filter/Models/cars_mod.dart';
import 'package:search_filter/utils/texts.dart';

class FordList extends StatelessWidget {
  final List<CarsModel> ford;

  const FordList({
    super.key,
    required this.ford,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ford",
          style: med16Mont,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: ford.length,
          itemBuilder: (context, index) => CardTile(
            data: ford[index],
          ),
        )
      ],
    );
  }
}
