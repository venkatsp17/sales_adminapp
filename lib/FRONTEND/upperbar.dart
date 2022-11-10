import 'package:flutter/material.dart';

class Upperbar extends StatefulWidget {
  const Upperbar({Key? key}) : super(key: key);

  @override
  State<Upperbar> createState() => _UpperbarState();
}

class _UpperbarState extends State<Upperbar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      width: width * 87.5,
      height: height * 8,
      color: const Color(0xffD9D9D9),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PopupMenuButton<int>(
              itemBuilder: (context1) => [
                // popupmenu item 1
                PopupMenuItem(
                  value: 1,
                  child: const Text("New Order",style: TextStyle(fontSize: 15),),
                  onTap: () async{
                    final navigator = Navigator.of(context);
                    // await Future.delayed(Duration.zero);
                    // navigator.push(
                    //   MaterialPageRoute(builder: (_) => const Neworder()),
                    // );
                  },
                ),
                // popupmenu item 2
                PopupMenuItem(
                  onTap: ()async{
                    final navigator = Navigator.of(context);
                    // await Future.delayed(Duration.zero);
                    // navigator.push(
                    //   MaterialPageRoute(builder: (_) => const Newcustomer()),
                    // );
                  },
                  value: 2,
                  child: const Text("New Customer",style: TextStyle(fontSize: 15),),
                ),
                PopupMenuItem(
                  onTap: ()async{
                    final navigator = Navigator.of(context);
                    // await Future.delayed(Duration.zero);
                    // navigator.push(
                    //   MaterialPageRoute(builder: (_) => const Newcustomer()),
                    // );
                  },
                  value: 3,
                  child: const Text("New Price List",style: TextStyle(fontSize: 15),),
                ),
                PopupMenuItem(
                  onTap: ()async{
                    final navigator = Navigator.of(context);
                    // await Future.delayed(Duration.zero);
                    // navigator.push(
                    //   MaterialPageRoute(builder: (_) => const Newcustomer()),
                    // );
                  },
                  value: 4,
                  child: const Text("New Item List",style: TextStyle(fontSize: 15),),
                ),
              ],
              offset: const Offset(60, 30),
              color: Colors.white,
              elevation: 2,
              child: const Icon(Icons.add_circle,size: 60,color: Colors.black54,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications,
                          size: 40, color: Colors.black54)),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Activity()));
                      },
                      icon: const Icon(Icons.calendar_today_outlined,
                          size: 40, color: Colors.black54)),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Activity()));
                      },
                      icon: const Icon(
                        Icons.circle,
                        color: Colors.orange,
                        size: 45,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
