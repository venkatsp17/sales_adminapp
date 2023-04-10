import 'package:admin_sales/FRONTEND/Orders/Listview.dart';
import 'package:admin_sales/FRONTEND/Orders/Listview1.dart';
import 'package:admin_sales/FRONTEND/Orders/Listview2.dart';
// import 'package:admin_sales/FRONTEND/upperbar.dart';
import 'package:flutter/material.dart';

import '../../Backend/Ordersb.dart';
import 'NewOrder.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

List data = [
  [
    {
      "name": "Venkat S P",
      "date": "23-11-2022",
      "expdel": "12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10 TON",
      "status": "Pending",
      "id": "O405"
    }
  ],
  [
    {
      "name": "Venkat S P",
      "date": "23-11-2022",
      "expdel": "12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10",
      "status": "Approved",
      "id": "O405"
    }
  ],
  [
    {
      "name": "Venkat S P",
      "date": "23-11-2022",
      "expdel": "12-12-2022",
      "products": ["APPLE LIME", "NOVA LIME", "WHITE CEMENT"],
      "tweigth": "10",
      "status": "DELIVERY",
      "id": "O405"
    }
  ],
];

class _OrdersState extends State<Orders> {
  int selected = 0;
  final Ordersb obj = Ordersb();
  List data1 = [];
  List data2 = [];
  List data3 = [];
  @override
  void initState() {
    // TODO: implement initState
    fetchOrderData();
    super.initState();
  }

  fetchOrderData() async {
    dynamic resultant = await obj.makeGetRequest();
    if (resultant == null) {
      print("Unable to retrieve");
    } else {
      setState(() {
        for (int i = 0; i < resultant.length; i++) {
          if (resultant[i]['status'] == "Not Approved" ||
              resultant[i]['status'] == "Pending") {
            data3.add(resultant[i]);
          } else if (resultant[i]['status'] == "Approved") {
            data2.add(resultant[i]);
          } else {
            data1.add(resultant[i]);
          }
        }
        print(data1);
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;
    return Container(
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
                    color: selected == 0
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
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
                    color: selected == 1
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
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
                    color: selected == 2
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
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
          s(selected),
        ],
      ),
    );
  }

  Widget s(int sel) {
    if (sel == 0) {
      return Listview(
        data: data3,
      );
    } else if (sel == 1) {
      return Listview1(
        data: data2,
      );
    } else {
      return Listview2(
        data: data1,
      );
    }
  }
}
