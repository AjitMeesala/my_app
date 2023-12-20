import 'dart:convert';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:my_app/Utilities/routes.dart";
import 'package:my_app/Widgets/home_widgets/catalog_header.dart';
import 'package:my_app/Widgets/home_widgets/catalog_list.dart';
import "package:velocity_x/velocity_x.dart";
import "package:my_app/Models/catalog.dart";
import "package:my_app/Widgets/themes.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.cardColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyTheme.darkBluishColor,
          onPressed: () => {Navigator.pushNamed(context, RouteSet.cartRoute)},
          child: const Icon(CupertinoIcons.cart, color: Colors.white, size: 25),
        ),
        body: SafeArea(
            // ignore: avoid_unnecessary_containers
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CatalogHeader(),
                    if (CatalogModel.items.isNotEmpty)
                      const CatalogList().pOnly(top: 16).expand()
                    else
                      const CircularProgressIndicator().centered().expand()
                  ],
                ))));
  }
}
