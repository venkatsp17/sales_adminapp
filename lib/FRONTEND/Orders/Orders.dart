import 'package:admin_sales/FRONTEND/Orders/Listview.dart';
import 'package:admin_sales/FRONTEND/upperbar.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

List data = [
  [
    {
      "name":"Venkat S P",
      "date":"23-11-2022",
      "expdel":"12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10 TON",
      "status":"Pending",
    }
  ],
  [
    {
      "name":"Venkat S P",
      "date":"23-11-2022",
      "expdel":"12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10 TON",
      "status":"Approved"
    }
  ],
  [
    {
      "name":"Venkat S P",
      "date":"23-11-2022",
      "expdel":"12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10 TON",
      "status":"DELIVERY"
    }
  ],
];
class _OrdersState extends State<Orders> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;
    return Container(
      width: width * 86.1,
      height: height * 100,
      child: Column(
        children: [
          const Upperbar(),
          Container(
            height: height * 92,
            width: width * 87.5,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 0;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 5,
                        width: width * 28.7,
                        decoration: BoxDecoration(
                          color: selected==0?const Color(0xff79C1E9):const Color(0xffD9D9D9),
                          border: Border.all(),
                        ),
                        child: const Text(
                          "Pending",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected==1?const Color(0xff79C1E9):const Color(0xffD9D9D9),
                          border: Border.all(),
                        ),
                        height: height * 5,
                        width: width * 28.7,
                        child: const Text(
                          "Approval",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = 2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selected==2?const Color(0xff79C1E9):const Color(0xffD9D9D9),
                          border: Border.all(),
                        ),
                        height: height * 5,
                        width: width * 28.7,
                        child: const Text(
                          "Delivery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Listview(data: data[selected]),
              ],
            ),
          )
        ],
      ),
    );
  }
}
