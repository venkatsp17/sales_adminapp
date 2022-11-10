import 'package:flutter/material.dart';

class Listview1 extends StatefulWidget {
  final data;
  const Listview1({Key? key, this.data}) : super(key: key);

  @override
  State<Listview1> createState() => _Listview1State();
}

class _Listview1State extends State<Listview1> {
  List mon = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  String val1 = "";
  TextEditingController dateController = TextEditingController();
  final TextEditingController _dname = TextEditingController();
  final TextEditingController _ph = TextEditingController();
  final TextEditingController _vno = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    dateController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
        // color: Colors.orange,
        width: width * 87.5,
        height: height * 87,
        child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffD9D9D9),
                  ),
                  height: height * 12,
                  width: width * 80,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 12.0, left: 25.0, right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 8,
                          child: Text(
                            "ORDER ID: ${widget.data[index]['id']}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height * 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width * 20,
                              child: Text(
                                "Customer Name: ${widget.data[index]['name']}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis
                                    // fontWeight: FontWeight.bold
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                              width: width * 20,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Cont("TON", widget.data[index]['tweigth']),
                                  Cont(
                                      mon[int.parse(widget.data[index]["date"]
                                              .toString()
                                              .substring(3, 5)) -
                                          1],
                                      widget.data[index]['date']
                                          .toString()
                                          .substring(0, 2)),
                                  Cont1("EXP DATE", dateController.text),
                                  Cont2("DEL DETAILS", val1),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height * 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.data[index]['products'][0],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              widget.data[index]['products'][1],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              widget.data[index]['products'][2],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height * 12,
                        ),
                        SizedBox(
                          width: width * 13,
                          child: const Text(
                            "READY FOR DELIVERY",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  Widget Cont2(String def, String data) {
    return SizedBox(
      height: 45,
      width: 60,
      child: PopupMenuButton<int>(
          position: PopupMenuPosition.under,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: data == ""
                  ? const Color(0xffD9D9D9)
                  : const Color(0xff069BEE),
              border: data == ""
                  ? Border.all()
                  : Border.all(color: const Color(0xffD9D9D9)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: data == ""
                ? SizedBox(
              width: 35,
              child: Text(
                def,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            )
                : Text(
              def,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          itemBuilder: (context1) => [
            // popupmenu item 1
            PopupMenuItem(
              value: 1,
              child: Container(
                width: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "DRIVER NAME: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 155,
                          child: TextField(
                              controller: _dname,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.drive_eta_rounded,size: 15,),
                                  labelText: "Enter Driver Name"
                              ),
                              // readOnly: true,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "PH NO: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: _ph,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.phone,size: 15,),
                                labelText: "Enter Ph No"
                            ),
                            // readOnly: true,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "VEHICLE NO: ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 160,
                          child: TextField(
                            controller: _vno,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.car_crash,size: 15,),
                                labelText: "Enter Vehicle No"
                            ),
                            // readOnly: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
    );
  }


  Widget Cont1(String def, String data) {
    return SizedBox(
      height: 45,
      width: 60,
      child: PopupMenuButton<int>(
        position: PopupMenuPosition.under,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: data == ""
                  ? const Color(0xffD9D9D9)
                  : const Color(0xff069BEE),
              border: data == ""
                  ? Border.all()
                  : Border.all(color: const Color(0xffD9D9D9)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: data == ""
                ? SizedBox(
                    width: 35,
                    child: Text(
                      def,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Text(
                    "${mon[int.parse(data.substring(2,3))-1]} ${data.substring(0,2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
              textAlign: TextAlign.center,
                  ),
          ),
          itemBuilder: (context1) => [
                // popupmenu item 1
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "EXP DATE: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        width: 150,
                        child: TextField(
                            controller: dateController,
                            decoration: const InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Enter Date"
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate:DateTime(2000),
                                  lastDate: DateTime(2101)
                              );
                              setState(() {
                                dateController.text = pickedDate.toString();
                              });
                            }
                        ),
                      )
                    ],
                  ),
                  // onTap: () async {
                  //   final navigator = Navigator.of(context);
                  //   // await Future.delayed(Duration.zero);
                  //   // navigator.push(
                  //   //   MaterialPageRoute(builder: (_) => const Neworder()),
                  //   // );
                  // },
                ),
              ]),
    );
  }

  Widget Cont(String def, String data) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: 60,
      color: const Color(0xff069BEE),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            def,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            data,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
