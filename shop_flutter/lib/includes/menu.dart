import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var navBarOptions = [
        'Home',
        'Shop',
        'Admin Panel',
        'Commands',
    ];
    var links = [
      '/',
      '/shop',
      '/admin',
      '/commands',
    ];

    return SafeArea(
      child: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: const Color.fromRGBO(17, 17, 17, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MenuLink(links: links, navBarOptions: navBarOptions, theme: theme, index: 0),
            MenuLink(links: links, navBarOptions: navBarOptions, theme: theme, index: 1),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const Image(
                image: AssetImage('assets/images/solixx_png.png'),
                width: 75,
                height: 75,
              ),
            )),
            MenuLink(links: links, navBarOptions: navBarOptions, theme: theme, index: 2),
            MenuLink(links: links, navBarOptions: navBarOptions, theme: theme, index: 2),
          ],
        ),
      ),
    );
  }
}

class MenuLink extends StatelessWidget {
  const MenuLink({
    super.key,
    required this.links,
    required this.navBarOptions,
    required this.theme,
    required this.index,
  });

  final List<String> links;
  final List<String> navBarOptions;
  final ThemeData theme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, links[index]);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        child: Text(
          textAlign: TextAlign.center,
          navBarOptions[index].toUpperCase(),
          style: TextStyle(
            color: theme.colorScheme.background,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}