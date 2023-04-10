import 'package:admin_sales/FRONTEND/Orders/Order_Details.dart';
import 'package:flutter/material.dart';

import '../../Navigation.dart';

class Listview extends StatefulWidget {
  final data;
  const Listview({Key? key, this.data}) : super(key: key);

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {


  List mon = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];


  String calcweight(List c){
    int sum =0;
    for(int i=0;i<c.length;i++) {
      for(int j=0;j<c[i]['details'].length;j++){
        sum += int.parse(c[i]['details'][j]['KG'])*int.parse(c[i]['details'][j]['qty']);
      }
    }
    return (sum/1000).toString();
  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Container(
      // color: Colors.orange,
      width: width * 87.5,
      height: height*87,
      child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              onTap: (){
                Navigation.homeNavigation.currentState?.push(MaterialPageRoute(builder: (BuildContext context)=>Orderdetails(data: widget.data[index],)));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xffD9D9D9),
                  ),
                  height: height*12,
                  width: width*80,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0,bottom: 12.0,left: 25.0,right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Container(
                            alignment: Alignment.center,
                            height: height*8,
                            width: width*7,
                            color: const Color(0xff069BEE),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  mon[int.parse(widget.data[index]['date'].toString().substring(5,7))-1],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.data[index]['date'].toString().substring(8,10),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width*20,
                              child: Text(
                                "Customer Name: ${widget.data[index]['customername']}" ,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis
                                    // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width*20,
                              child: Text(
                                "Order ID: ${widget.data[index]['orderid']}" ,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text(
                              "Expected Delivery: ${mon[int.parse(widget.data[index]['deliveryddate'].toString().substring(5,7))-1] } ${widget.data[index]['deliveryddate'].toString().substring(8,10)}" ,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height*12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: width*20,
                              child: Text(
                                widget.data[index]['products'][0]['itemname'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text(
                              (widget.data[index]['products'].length>1)?widget.data[index]['products'][1]['itemname']:"",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              (widget.data[index]['products'].length>2)?widget.data[index]['products'][2]['itemname']:"",
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
                          height: height*12,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: height*8,
                          width: width*7,
                          color: const Color(0xff069BEE),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: width*4,
                                child: Text(
                                  calcweight(widget.data[index]['products']),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                width: width*4,
                                child: const Text(
                                  "TON",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(onPressed: (){

                            }, child: const Text(
                              "APPROVE",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            ),
                            TextButton(onPressed: (){

                            }, child: const Text(
                              "DISAPPROVE",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      )
    );
  }
}
