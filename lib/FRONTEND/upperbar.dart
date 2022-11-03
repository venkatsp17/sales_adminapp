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
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle,
                  size: 50,
                  color: Colors.black54,
                )),
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
