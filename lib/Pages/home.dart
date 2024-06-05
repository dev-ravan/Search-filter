import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search_filter/Modules/animals_mod.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  List<AnimalsModel> _animals = [];
  List<AnimalsModel> filteredAnimals = [];

  void _loadAnimals() async {
    const url = "https://freetestapi.com/api/v1/animals";
    Response res = await _dio.get(url);
    List<AnimalsModel> animals = [];
    if (res.data != null) {
      for (var animal in res.data) {
        animals.add(AnimalsModel.fromJson(animal));
      }
      setState(() {
        _animals = animals;
        filteredAnimals = _animals;
      });
    }
  }

  @override
  void initState() {
    _loadAnimals();
    super.initState();
  }

  void searchAnimal(String query) {
    if (query.isNotEmpty) {
      filteredAnimals = _animals.where((animal) {
        return animal.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredAnimals = _animals;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Animals",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [_buildSearch()],
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SizedBox.expand(
      child: ListView.builder(
        itemCount: filteredAnimals.length,
        itemBuilder: (context, index) {
          AnimalsModel animals = filteredAnimals[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(animals.image),
            ),
            title: Text(animals.name,
                style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text(animals.description),
          );
        },
      ),
    );
  }

  Widget _buildSearch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          width: MediaQuery.of(context).size.width / 1.7,
          child: TextField(
            onChanged: searchAnimal,
            decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.search),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          )),
    );
  }
}
