import 'package:admin_sales/FRONTEND/Collection.dart';
import 'package:admin_sales/FRONTEND/Orders/NewOrder.dart';
import 'package:admin_sales/FRONTEND/Orders/Orders.dart';
import 'package:admin_sales/FRONTEND/upperbar.dart';
// import 'package:admin_sales/FRONTEND/upperbar.dart';
import 'package:flutter/material.dart';

import '../Navigation.dart';
// import 'Orders/OrderHome.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int select = 0;
  bool vis = false;
  List users = [
    {"name": "Balan", "status": "online"},
    {"name": "Balan", "status": "offline"},
    {"name": "Balan", "status": "online"}
  ];
  List<String> items = ["Balan", "Balan1", "Balan2"];
  String dropdownvalue = "Balan";

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    // var height = size.height / 100;
    // var width = size.width / 100;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            height: 850,
            decoration: BoxDecoration(
              color: const Color(0xffD9D9D9),
              border: Border.symmetric(
                  vertical: BorderSide.lerp(const BorderSide(width: 0),
                      const BorderSide(width: 1.0), 1)),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  color: const Color(0xffD9D9D9),
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        // margin: const EdgeInsets.all(100.0),
                        decoration: const BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                      ),
                      PopupMenuButton<int>(
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      // margin: const EdgeInsets.all(100.0),
                                      decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle),
                                    ),
                                    title: Text(users[0]["name"]),
                                    trailing: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        primary:
                                        users[0]["status"] == "online"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      onPressed: () {},
                                      child: Text(users[0]["status"]),
                                    ),
                                  ),
                                )
                            ),
                            PopupMenuItem(
                                value: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      // margin: const EdgeInsets.all(100.0),
                                      decoration: const BoxDecoration(
                                          color: Colors.orange,
                                          shape: BoxShape.circle),
                                    ),
                                    title: Text(users[0]["name"]),
                                    trailing: OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        primary:
                                        users[0]["status"] == "online"
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      onPressed: () {},
                                      child: Text(users[0]["status"]),
                                    ),
                                  ),
                                )
                            )
                          ],
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 2,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: const Color(0xff79C1E9),
                  color: const Color(0xffD9D9D9),
                  elevation: select == 0 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 0 ? 30.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 0 ? 30.0 : 0.0))),
                    tileColor: select == 0
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.analytics),
                    title: const Text('Orders'),
                    onTap: () {
                      setState(() {
                        select = 0;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/orders');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 1 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 1 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 1 ? 25.0 : 0.0))),
                    tileColor: select == 1
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.storage_outlined),
                    title: const Text('Collection'),
                    onTap: () {
                      setState(() {
                        select = 1;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 2 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 2 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 2 ? 25.0 : 0.0))),
                    tileColor: select == 2
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    selectedColor: const Color(0xff79C1E9),
                    leading: const Icon(Icons.storage_outlined),
                    title: const Text('Expenses'),
                    onTap: () {
                      setState(() {
                        select = 2;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Container(
                  color: Colors.grey,
                  height: 2,
                  width: double.infinity,
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 3 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 3 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 3 ? 25.0 : 0.0))),
                    tileColor: select == 3
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.analytics),
                    title: const Text('Analytics'),
                    onTap: () {
                      setState(() {
                        select = 3;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 4 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 4 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 4 ? 25.0 : 0.0))),
                    tileColor: select == 4
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.details),
                    title: const Text('Details'),
                    onTap: () {
                      setState(() {
                        select = 4;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 5 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 5 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 5 ? 25.0 : 0.0))),
                    tileColor: select == 5
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.storage_outlined),
                    title: const Text('Price List'),
                    onTap: () {
                      setState(() {
                        select = 5;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  shadowColor: Colors.black,
                  color: const Color(0xffD9D9D9),
                  elevation: select == 6 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 6 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 6 ? 25.0 : 0.0))),
                    tileColor: select == 6
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.list),
                    title: const Text('Item List'),
                    onTap: () {
                      setState(() {
                        select = 6;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffD9D9D9),
                  elevation: select == 7 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 7 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 7 ? 25.0 : 0.0))),
                    tileColor: select == 7
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.holiday_village),
                    title: const Text('Leave'),
                    onTap: () {
                      setState(() {
                        select = 7;
                      });
                      Navigation.homeNavigation.currentState
                          ?.pushNamed('/home/collection');
                    },
                  ),
                ),
                Material(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffD9D9D9),
                  elevation: select == 8 ? 30 : 0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight:
                                Radius.circular(select == 8 ? 25.0 : 0.0),
                            bottomRight:
                                Radius.circular(select == 8 ? 25.0 : 0.0))),
                    tileColor: select == 8
                        ? const Color(0xff79C1E9)
                        : const Color(0xffD9D9D9),
                    leading: const Icon(Icons.drafts),
                    title: const Text('Draft'),
                    onTap: () {
                      setState(() {
                        select = 8;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Navigator(
              key: Navigation.homeNavigation,
              initialRoute: 'home/orders',
              onGenerateRoute: (RouteSettings settings) {
                Widget page;

                switch (settings.name) {
                  case 'home/orders':
                    page = const Orders();
                    break;
                  case '/home/collection':
                    page = const Collection();
                    break;
                  case '/home/neworder':
                    page = const Neworder();
                    break;
                  default:
                    page = const Orders();
                }
                return PageRouteBuilder(
                    pageBuilder:
                        (context, animation, secondaryAnimation) => page,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return Column(
                        children: [
                          const Upperbar(),
                          Container(
                            child: child,
                          ),
                        ],
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
