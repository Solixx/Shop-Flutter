import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './includes/menu.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    var theme = Theme.of(context);
    var heroSection = [
      "Design for people of tomorrow",
      "SUMMER COLLECTION",
      "Descover Now",
    ];
    var primeSection = [
      "Design for the prime people",
      "Prime Collection",
      "Shop Now",
    ];
    var padding = 100.0;

    Color heroBtnColor = theme.colorScheme.background;
    Color heroBtnTextColor = theme.colorScheme.secondary;
    Color heroTextColor = theme.colorScheme.background;

    Color primeBtnColor = const Color.fromRGBO(17, 17, 17, 1);
    Color primeBtnTextColor = theme.colorScheme.background;
    Color primeTextColor = const Color.fromRGBO(218, 165, 32, 1);

    Color genderBtnColor = const Color.fromRGBO(17, 17, 17, 1);
    Color genderBtnTextColor = theme.colorScheme.background;
    String manImg = 'assets/images/mikey13.jpg';
    String womanImg = 'assets/images/hutao_render2.jpg';

    return ListView(children: [
      Section(
          collectTexts: heroSection,
          theme: theme,
          image: 'assets/images/933854.jpg',
          btnColor: heroBtnColor,
          btnTextColor: heroBtnTextColor,
          textColor: heroTextColor),
      SizedBox(
        height: padding,
      ),
      Gender(
        btnColor: genderBtnColor,
        btnTextColor: genderBtnTextColor,
        manImg: manImg,
        womanImg: womanImg,
      ),
      SizedBox(
        height: padding,
      ),
      const NewArrivals(),
      SizedBox(
        height: padding,
      ),
      Section(
          collectTexts: primeSection,
          theme: theme,
          image: 'assets/images/Senju_Kawaragi.jpg',
          btnColor: primeBtnColor,
          btnTextColor: primeBtnTextColor,
          textColor: primeTextColor),
    ]);
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.collectTexts,
    required this.theme,
    required this.image,
    required this.btnColor,
    required this.btnTextColor,
    required this.textColor,
  });

  final List<String> collectTexts;
  final ThemeData theme;
  final String image;
  final Color btnColor;
  final Color btnTextColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 75.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 140.0),
                    child: Column(
                      children: [
                        Text(
                          collectTexts[0].toUpperCase(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          collectTexts[1].toUpperCase(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0)),
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 50, right: 50),
                              backgroundColor: btnColor,
                              foregroundColor: btnTextColor,
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: Text(collectTexts[2].toUpperCase())),
                      ],
                    ),
                  )
                ],
              )
            ])
      ],
    );
  }
}

class Gender extends StatelessWidget {
  const Gender({
    super.key,
    required this.btnColor,
    required this.btnTextColor,
    required this.manImg,
    required this.womanImg,
  });

  final Color btnColor;
  final Color btnTextColor;
  final String manImg;
  final String womanImg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Stack(alignment: AlignmentDirectional.center, children: [
            Image(
              image: AssetImage(manImg),
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width / 2 - 20,
              fit: BoxFit.cover,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                padding: const EdgeInsets.only(
                    top: 25, bottom: 25, left: 35, right: 35),
                backgroundColor: btnColor,
                foregroundColor: btnTextColor,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text("SHOP MEN"),
            ),
          ]),
          Stack(alignment: AlignmentDirectional.center, children: [
            Image(
              image: AssetImage(womanImg),
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width / 2 - 20,
              fit: BoxFit.cover,
            ),
            ElevatedButton(
              onPressed: () => {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
                padding: const EdgeInsets.only(
                    top: 25, bottom: 25, left: 35, right: 35),
                backgroundColor: btnColor,
                foregroundColor: btnTextColor,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text("SHOP WOMEN"),
            ),
          ]),
        ]),
      ],
    );
  }
}

class NewArrivals extends StatelessWidget {
  const NewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var products = appState.products;

    return Container(
      height: 400 + 200,
      child: Column(
        children: [
          const Text(
            "NEW ARRIVALS",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; i < min(5, products.length); i++)
                Column(
                  children: [
                    Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Image.file(
                            products[i].img,
                            width: 250,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                          if (products[i].status.isNotEmpty)
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(17, 17, 17, 1),
                              ),
                              width: 250,
                              child: Text(
                                products[i].status.toUpperCase(),
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
                      products[i].categorie.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${products[i].price}€",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
