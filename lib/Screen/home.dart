import 'package:flutter/material.dart';

class ProductHome extends StatefulWidget {
  const ProductHome({Key? key}) : super(key: key);

  @override
  State<ProductHome> createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome> {
  double slide = 0;
  List iteam = [
    "Cloth",
    "TV",
    "Refrigerator",
    "Mobile",
    "Kitchen Sets",
    "AC",
    "Iphone",
    "Laptop",
    "Computer",
    "Electric Bike",
    "Furniture",
    "Bike"
  ];
  List rate = [
    "2000",
    "10000",
    "20000",
    "20000",
    "25000",
    "25000",
    "30000",
    "30000",
    "40000",
    "50000",
    "60000",
    "80000"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          title: Text(
            "Product Filter",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          )),
      body: Column(
        children: [
          SizedBox(height: 10),
          Slider(
            value: slide,
            onChanged: (value) {
              setState(() {
                slide = value;
              });
            },
            activeColor: Colors.indigoAccent,
            divisions: 8,
            label: "Range",
            inactiveColor: Colors.indigo.shade100,
            max: 80000,
            min: 0,
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Product Less than ${slide.toInt()}",
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.indigoAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return slide.toInt() >= int.parse(rate[index])
                  ? countProduct(iteam[index], rate[index])
                  : SizedBox();
            },
            itemCount: rate.length,
          ))
        ],
      ),
    ));
  }

  Widget countProduct(String name, String rate) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.indigoAccent, spreadRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "$name",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Text(
            "-->",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Text(
            "$rate",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
