import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sourcify"),
      ),
      body: Center(
        child: Container(
          child: const Text("Hello World!!! I am Ajit"),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
