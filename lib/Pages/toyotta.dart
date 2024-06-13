import 'package:flutter/material.dart';
import 'package:search_filter/Components/card_tile.dart';
import 'package:search_filter/Models/cars_mod.dart';
import 'package:search_filter/utils/texts.dart';

class ToyottaList extends StatelessWidget {
  final List<CarsModel> toyota;
  const ToyottaList({
    super.key,
    required this.toyota,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Toyota",
          style: med16Mont,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: toyota.length,
          itemBuilder: (context, index) => CardTile(
            data: toyota[index],
          ),
        )
      ],
    );
  }
}
