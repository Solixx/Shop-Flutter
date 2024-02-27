import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './includes/menu.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var products = appState.products;

    return ListView(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
                child: Text(
              "SHOP",
              style: TextStyle(
                fontSize: 43,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(
              height: 50,
            ),
            Padding(
              /* height: 10000, */
              padding: const EdgeInsets.all(50.0),
              child: Expanded(
                child: Wrap(
                  direction: Axis.horizontal, 
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    for (Products prod in products)
                      Column(
                        children: [
                          Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.file(
                                  prod.img,
                                  width: 350,
                                  height: 550,
                                  fit: BoxFit.cover,
                                ),
                                if (prod.status.isNotEmpty)
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(17, 17, 17, 1),
                                    ),
                                    width: 350,
                                    child: Text(
                                      prod.status.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                              ]),
                          const SizedBox(height: 10),
                          Text(
                            prod.categorie.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${prod.price}€",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                ]),
              ),
            ),
          ],
        )
      ],
    );
  }
}
