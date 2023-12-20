import 'package:flutter/material.dart';
import 'package:my_app/Models/catalog.dart';
import 'package:my_app/Widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetails extends StatelessWidget {
  final Item catalog;
  const ProductDetails({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            buttonPadding: EdgeInsets.zero,
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              "\$${catalog.price}".text.bold.xl4.make(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))),
                child: "Add to Cart".text.white.make(),
              )
            ],
          ).p32(),
        ),
        appBar: AppBar(
          title: catalog.name.text.make(),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Hero(
                  tag: catalog.id.toString(),
                  child: Image.network(catalog.image).p16().h32(context)),
              Expanded(
                child: VxArc(
                    height: 30.0,
                    edge: VxEdge.top,
                    arcType: VxArcType.convey,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.darkBluishColor)
                              .bold
                              .make(),
                          catalog.desc.text.xl
                              .textStyle(context.captionStyle!)
                              .make(),
                          10.heightBox,
                          "Dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"
                              .text
                              .textStyle(context.captionStyle!)
                              .make()
                              .p16()
                        ],
                      ).py64(),
                    )),
              ),
            ],
          ),
        ));
  }
}
