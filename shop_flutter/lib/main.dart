import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import './MyHomePage.dart';
import './ShopPage.dart';
import './AdminPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'COH Store App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
        routes: {
          '/home': (context) => const MyHomePage(),
          '/shop': (context) => const ShopPage(),
          '/admin': (context) => const AdminPage(),
          /* '/commands': (context) => const MyHomePage(), */
        },
      ),
    );
  }
}

class Products {
  int index;
  String name;
  double price;
  File img;
  String categorie;
  String status;

  Products(this.index, this.name, this.price, this.img, this.categorie, this.status);

  void update(String name, double price, File img, String categorie, String status) {
    this.name = name;
    this.price = price;
    this.img = img;
    this.categorie = categorie;
    this.status = status;
  }
}

class MyAppState extends ChangeNotifier {
  /* var products = <Products>[]; */
  var products = <Products>[/* 
    Products(
        "Pijama",
        30.0,
        'assets/images/648ac0d80c45089d0e08e99dd865479a.jpg',
        "clothes",
        "new"),
    Products(
        "School Jacket",
        50.0,
        'assets/images/226f95369c07b39762444b6611b6d87a.jpg',
        "clothes",
        "new"),
    Products(
        "Shirt",
        75.0,
        'assets/images/15f1dae2caac44e7bcec9611ec721b61.jpg',
        "clothes",
        "new"),
    Products(
        "Jacket",
        70.0,
        'assets/images/7ed0989741fb2fdf9eea1d5d87ab222c.jpg',
        "clothes",
        "new"),
    Products(
        "Shirt",
        90.0,
        'assets/images/5ea9b64cddb01bf45be651c4b24ba5b2.jpg',
        "clothes",
        "new"),
   */];

  void addProduct(Products product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(Products product) {
    products.remove(product);
    notifyListeners();
  }

  void updateProduct(int index, String name, double price, File img,
      String categorie, String status) {

    /* int index = products.indexOf(product); */
    products[index].name = name;
    products[index].price = price;
    products[index].img = img;
    products[index].categorie = categorie;
    products[index].status = status;
    
    notifyListeners();
  }

  FilePickerResult? result, result2, result3;
  PlatformFile? pickedfile, pickedfile2, pickedfile3;
  File? fileToDisplay, fileToDisplay2, fileToDisplay3;
  String? fileName, fileName2, fileName3;

  void changPickedFile(FilePickerResult result, PlatformFile pickedfile,
      File fileToDisplay, String fileName, index) {
    
    if(index == 1){
      this.result = result;
      this.pickedfile = pickedfile;
      this.fileToDisplay = fileToDisplay;
      this.fileName = fileName;
    } else if( index == 2){
      result2 = result;
      pickedfile2 = pickedfile;
      fileToDisplay2 = fileToDisplay;
      fileName2 = fileName;
    } else if( index == 3){
      result3 = result;
      pickedfile3 = pickedfile;
      fileToDisplay3 = fileToDisplay;
      fileName3 = fileName;
    }
    
    notifyListeners();
  }

  int selectedOption = 0;
  int selectedOptionEdit = 0;

  void changeSelectedOption(int index) {
    selectedOption = index;
    notifyListeners();
  }

  void changeSelectedOptionEdit(int index) {
    selectedOptionEdit = index;
    notifyListeners();
  }
}
