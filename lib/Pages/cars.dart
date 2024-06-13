import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:search_filter/Constants/endpoints.dart';
import 'package:search_filter/Models/cars_mod.dart';
import 'package:search_filter/Pages/ford.dart';
import 'package:search_filter/Pages/toyotta.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  // DATA
  final client = http.Client();
  List<CarsModel> fordList = [];
  List<CarsModel> toyotaList = [];

  // UI
  List<Widget> pages = [];

  int selectedIndex = 0;

  // GET DATA FROM API CALL
  Future<List<CarsModel>> getCars() async {
    final response = await client.get(Uri.parse(carsUrl));

    return carsModelFromJson(response.body);
  }

  void getCarsWithMake() {
    getCars().then((val) {
      if (val.isNotEmpty) {
        fordList.clear();
        toyotaList.clear();

        //
        for (var car in val) {
          if (car.make == "Toyota") {
            toyotaList.add(car);
          } else if (car.make == "Ford") {
            fordList.add(car);
          }
        }

        //
        print(fordList);
        print(toyotaList);
        setState(() {
          pages = [
            ToyottaList(
              toyota: toyotaList,
            ),
            FordList(
              ford: fordList,
            )
          ];
        });
      } else {
        print("No data available");
      }
    });
  }

  @override
  void initState() {
    getCarsWithMake();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CARS"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.car_rental_outlined), label: "Toyota"),
            BottomNavigationBarItem(
                icon: Icon(Icons.car_repair_outlined), label: "Ford")
          ]),
      body: pages.isNotEmpty
          ? pages.elementAt(selectedIndex)
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
