// import 'package:admin_sales/FRONTEND/Orders/OrderHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../Navigation.dart';

class Neworder extends StatefulWidget {
  const Neworder({Key? key}) : super(key: key);

  @override
  State<Neworder> createState() => _NeworderState();
}

class _NeworderState extends State<Neworder> {
  double h = 1.0;
  int count = 1;
  final TextEditingController _orderid = TextEditingController();
  final TextEditingController _remarks = TextEditingController();
  String selectedValue = "";
  String? dropdownvalue = "Cash";
  String? dropdownvalue1 = "Method 12345";
  List<String> names = [
    "C109 : Venkat S P",
    "C110 : Venkat S P",
    "C111 : Venkat S P"
  ];
  List<String> items = ['Cash', 'Cheque', 'Online Payment', 'UPI'];
  List<String> items1 = ['Method 12345', 'Method 13545', 'Method 45645'];
  List orderitems = [
    {
      "itemname": TextEditingController(),
      "qty": TextEditingController(),
      "rate": TextEditingController(),
      "amount": TextEditingController()
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
        height: height * 92,
        width: width * 86.1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 20,),
                      IconButton(onPressed: (){
                        Navigation.homeNavigation.currentState?.pop();
                      }, icon: const Icon(Icons.close_rounded,size: 30,)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 180,
                        child: Text(
                          "Customer Name",
                          style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      SizedBox(
                        width: 270,
                        height: 70,
                        child: DropdownSearch<String>(
                          mode: Mode.DIALOG,
                          showClearButton: true,
                          selectedItem: selectedValue,
                          showSelectedItems: true,
                          showSearchBox: true,
                          items: names,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 180,
                        child: Text(
                          "Order ID",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 60,
                        width: 265,
                        child: TextField(
                          controller: _orderid,
                          decoration: const InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                            labelText: 'Order ID',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 180,
                        child: Text(
                          "Order Date",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 60,
                        width: 265,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            fillColor: Colors.white70,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          controller: TextEditingController(
                            text: (DateTime.now()
                                .toString()
                                .substring(0, 10)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 180,
                        child: Text(
                          "Payment Method",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 180,
                        child: Text(
                          "Delivery Method",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items1.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      "ITEM DETAILS",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoScrollbar(
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 350,
                      // color: Colors.blue,
                      child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: orderitems.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              // color: Colors.green,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 265,
                                          child: TextField(
                                            decoration:
                                                const InputDecoration(
                                              fillColor: Colors.white70,
                                              filled: true,
                                              labelText: "ITEM NAME",
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['itemname'],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        IconButton(
                                            iconSize: 35,
                                            onPressed: () {
                                              setState(() {
                                                orderitems.removeAt(index);
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove_circle,
                                              color: Colors.red,
                                              // size: 50,
                                            ))
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration:
                                                const InputDecoration(
                                              fillColor: Colors.white70,
                                              labelText: "OTY",
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['qty'],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration:
                                                const InputDecoration(
                                              labelText: "RATE",
                                              fillColor: Colors.white70,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['rate'],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                          height: 50,
                                          width: 110,
                                          child: TextField(
                                            decoration:
                                                const InputDecoration(
                                              labelText: "AMT",
                                              fillColor: Colors.white70,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                            ),
                                            controller: orderitems[index]
                                                ['amount'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        orderitems.add({
                          "itemname": TextEditingController(),
                          "qty": TextEditingController(),
                          "rate": TextEditingController(),
                          "amount": TextEditingController()
                        });
                      });
                    },
                    child: Container(
                      // color: Colors.cyan,
                      alignment: Alignment.centerLeft,
                      height: 40,
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.add_circle,
                            size: 40,
                          ),
                          Text(
                            "ADD NEW LINE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            "5000",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 190,
                    child: Text(
                      "REMARKS",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    height: 150,
                    width: 400,
                    child: TextField(
                      maxLines: 6,
                      decoration: const InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      controller: _remarks,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "Expected Delivery Date",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      GestureDetector(
                        onTap: () => _showDatePicker(context),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ), //BoxShadow
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxS
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.grey,
                          ),
                          alignment: Alignment.center,
                          height: 50,
                          width: 200,
                          child: _chosenDateTime == null
                              ? const Text(
                                  "Pick a Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  _chosenDateTime
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            "Delivery From",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Container(
                        height: 60,
                        width: 145,
                        child: DropdownButton(
                          value: dropdownvalue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: items1.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.orange),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10)))),
                        onPressed: () {
                          setState(() {
                          });
                        },
                        child: const Text(
                          "Place Order",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 300,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     style: ButtonStyle(
                    //         backgroundColor: MaterialStateProperty.all<Color>(
                    //             Colors.red
                    //         ),
                    //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //             RoundedRectangleBorder(
                    //                 borderRadius: BorderRadius.circular(10)
                    //             )
                    //         )
                    //     ),
                    //     onPressed: () {
                    //         Navigator.pop(context);
                    //     },
                    //     child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
    );
  }

  DateTime? _chosenDateTime;
  // Show the modal that contains the CupertinoDatePicker
  void _showDatePicker(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 400,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: _chosenDateTime ?? DateTime.now(),
                        onDateTimeChanged: (val) {
                          setState(() {
                            _chosenDateTime = val;
                          });
                        }),
                  ),
                ],
              ),
            ));
  }
}
