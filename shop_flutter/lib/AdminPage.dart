import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import './main.dart';
import './includes/menu.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Menu(),
          const Expanded(
            child: GeneratorPage(),
          ),
        ],
      ),
    );
  }
}

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    List<Products?> products = appState.products;
    int selectedOption = appState.selectedOption;
    int selectedOptionEdit = appState.selectedOptionEdit;

    FilePickerResult? resultAdd = appState.result;
    PlatformFile? pickedfileAdd = appState.pickedfile;
    File? fileToDisplayAdd = appState.fileToDisplay;
    String? _fileNameAdd = appState.fileName;
    FilePickerResult? resultEdit = appState.result2;
    PlatformFile? pickedfileEdit = appState.pickedfile2;
    File? fileToDisplayEdit = appState.fileToDisplay2;
    String? _fileNameEdit = appState.fileName2;
    FilePickerResult? resultDelete = appState.result3;
    PlatformFile? pickedfileDelete = appState.pickedfile3;
    File? fileToDisplayDelete = appState.fileToDisplay3;
    String? _fileNameDelete = appState.fileName3;

    
    final _formAdd = GlobalKey<FormState>();
    final _formEdit = GlobalKey<FormState>();
    final _formDelete = GlobalKey<FormState>();

    bool isLoading = false;

    TextEditingController _formAdd_nameController = TextEditingController();
    TextEditingController _formAdd_priceController = TextEditingController();
    TextEditingController _formAdd_categorieController = TextEditingController();
    TextEditingController _formAdd_statusController = TextEditingController();

    TextEditingController _formEdit_idController = TextEditingController();
    TextEditingController _formEdit_nameController = TextEditingController();
    TextEditingController _formEdit_priceController = TextEditingController();
    TextEditingController _formEdit_categorieController = TextEditingController();
    TextEditingController _formEdit_statusController = TextEditingController();

    if(products.length > 0){
      /* _formEdit_idController.text = products[0]!.id.toString(); */
      if(selectedOptionEdit >= products.length){
        selectedOptionEdit = products.length-1;
      }
      _formEdit_nameController.text = products[selectedOptionEdit]!.name;
      _formEdit_priceController.text = products[selectedOptionEdit]!.price.toString();
      _formEdit_categorieController.text = products[selectedOptionEdit]!.categorie;
      _formEdit_statusController.text = products[selectedOptionEdit]!.status;
    }

    TextEditingController _formDelete_idController = TextEditingController();
    TextEditingController _formDelete_nameController = TextEditingController();
    TextEditingController _formDelete_priceController = TextEditingController();
    TextEditingController _formDelete_categorieController = TextEditingController();
    TextEditingController _formDelete_statusController = TextEditingController();

    if(products.length > 0){
      /* _formDelete_idController.text = products[0]!.id.toString(); */
      if(selectedOption >= products.length){
        selectedOption = products.length-1;
      }
      _formDelete_nameController.text = products[selectedOption]!.name;
      _formDelete_priceController.text = products[selectedOption]!.price.toString();
      _formDelete_categorieController.text = products[selectedOption]!.categorie;
      _formDelete_statusController.text = products[selectedOption]!.status;
    }

    void pickFile(FilePickerResult? result, PlatformFile?  pickedfile, File? fileToDisplay, String? _fileName, int index) async {
      try {
        setState(() {
          isLoading = true;
        });

        result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
          allowMultiple: false,
        );

        if (result != null) {
          pickedfile = result!.files.first;
          fileToDisplay = File(pickedfile!.path!);
          _fileName = pickedfile?.name;
        }

        setState(() {
          isLoading = false;
        });

        appState.changPickedFile(
            result!, pickedfile!, fileToDisplay!, _fileName!, index);
      } catch (e) {
        print(e);
      }
    }

    return ListView(
      children: [
        Column(children: [
          const SizedBox(
            height: 50,
          ),
          const Center(
              child: Text(
            "ADMIN PANEL",
            style: TextStyle(
              fontSize: 43,
              fontWeight: FontWeight.bold,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              width: 500,
              child: Form(
                  key: _formAdd,
                  child: Column(
                    children: [
                      const Text("Add Product"),
                      TextFormField(
                        controller: _formAdd_nameController,
                        decoration: const InputDecoration(
                          labelText: 'Product Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _formAdd_priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Price',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a price';
                          } else if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              pickFile(resultAdd, pickedfileAdd, fileToDisplayAdd, _fileNameAdd, 1);
                            },
                            child: const Text('Selecionar Imagem'),
                          ),
                          if (fileToDisplayAdd != null)
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Card(
                                child: Image.file(
                                  fileToDisplayAdd!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                      TextFormField(
                        controller: _formAdd_categorieController,
                        decoration: const InputDecoration(
                          labelText: 'Categoria',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a categorie';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _formAdd_statusController,
                        decoration: const InputDecoration(
                          labelText: 'Categoria',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a categorie';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formAdd.currentState!.validate()) {
                            Products newProd = Products(
                                products.length,
                                _formAdd_nameController.text,
                                double.parse(_formAdd_priceController.text),
                                fileToDisplayAdd!,
                                _formAdd_categorieController.text,
                                _formAdd_statusController.text);
                            products.add(newProd);
                          }
                        },
                        child: const Text('Add Product'),
                      ),
                    ],
                  )),
            ),
          ),
          if(products.length > 0)
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 500,
                child: Form(
                    key: _formEdit,
                    child: Column(
                      children: [
                        const Text("Edit Product"),
                        DropdownButtonFormField(
                          value: selectedOptionEdit,
                          /* icon: const Icon(Icons.arrow_downward), */
                          items: products.map((product) {
                            return DropdownMenuItem<int>(
                              value: product!.index,
                              child: Text(product.index.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              appState.changeSelectedOptionEdit(value!);
                              /* selectedOption = value!; */
                            });
                          },
                         ),
                        TextFormField(
                          controller: _formEdit_nameController,
                          /* initialValue: products[0]?.name, */
                          decoration: const InputDecoration(
                            labelText: 'Product Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _formEdit_priceController,
                          /* initialValue: products[0]?.price.toString(), */
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Price',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            } else if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                pickFile(resultEdit, pickedfileEdit, fileToDisplayEdit, _fileNameEdit, 2);
                              },
                              child: const Text('Selecionar Imagem'),
                            ),
                            if (fileToDisplayEdit == null) 
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Card(
                                  child: Image.file(
                                    products[selectedOptionEdit]!.img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            if (fileToDisplayEdit != null) 
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Card(
                                  child: Image.file(
                                    fileToDisplayEdit!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        TextFormField(
                          controller: _formEdit_categorieController,
                          /* initialValue: products[0]?.categorie, */
                          decoration: const InputDecoration(
                            labelText: 'Categoria',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a categorie';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _formEdit_statusController,
                          /* initialValue: products[0]?.status, */
                          decoration: const InputDecoration(
                            labelText: 'Categoria',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a categorie';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formEdit.currentState!.validate()) {
                              appState.updateProduct(selectedOptionEdit, _formEdit_nameController.text, double.parse(_formEdit_priceController.text), fileToDisplayEdit ?? products[selectedOptionEdit]!.img, _formEdit_categorieController.text, _formEdit_statusController.text);
                            }
                          },
                          child: const Text('Edit Product'),
                        ),
                      ],
                    )),
              ),
            ),
          if(products.length > 0)
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 500,
                child: Form(
                    key: _formDelete,
                    child: Column(
                      children: [
                        const Text("Delete Product"),
                        DropdownButtonFormField(
                          value: selectedOption,
                          /* icon: const Icon(Icons.arrow_downward), */
                          items: products.map((product) {
                            return DropdownMenuItem<int>(
                              value: product!.index,
                              child: Text(product.index.toString()),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              appState.changeSelectedOption(value!);
                              /* selectedOption = value!; */
                            });
                          },
                         ),
                        TextFormField(
                          controller: _formDelete_nameController,
                          /* initialValue: products[0]?.name, */
                          decoration: const InputDecoration(
                            labelText: 'Product Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _formDelete_priceController,
                          /* initialValue: products[0]?.price.toString(), */
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Price',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a price';
                            } else if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                pickFile(resultEdit, pickedfileEdit, fileToDisplayEdit, _fileNameEdit, 2);
                              },
                              child: const Text('Selecionar Imagem'),
                            ),
                            if (fileToDisplayEdit == null) 
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Card(
                                  child: Image.file(
                                    products[selectedOption]!.img,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            if (fileToDisplayEdit != null) 
                              SizedBox(
                                height: 200,
                                width: 200,
                                child: Card(
                                  child: Image.file(
                                    fileToDisplayEdit!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        TextFormField(
                          controller: _formDelete_categorieController,
                          /* initialValue: products[0]?.categorie, */
                          decoration: const InputDecoration(
                            labelText: 'Categoria',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a categorie';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _formDelete_statusController,
                          /* initialValue: products[0]?.status, */
                          decoration: const InputDecoration(
                            labelText: 'Categoria',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a categorie';
                            }
                            return null;
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formEdit.currentState!.validate()) {
                              selectedOption--;
                              appState.removeProduct(products[selectedOption+1]!);
                            }
                          },
                          child: const Text('Delete Product'),
                        ),
                      ],
                    )),
              ),
            ),
        ])
      ],
    );
  }
}
