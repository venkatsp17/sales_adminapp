import 'package:admin_sales/FRONTEND/Collections/Collection_Details.dart';
import 'package:flutter/material.dart';

import '../../Backend/Detailsb.dart';
import '../../Navigation.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {


  final Detailsb obj = Detailsb();


  @override
  void initState() {
    // TODO: implement initState
    fetchCollectionData();
    super.initState();
  }

  fetchCollectionData() async {
    dynamic resultant = await obj.makeGetRequest();
    if(resultant==null){
      print("Unable to retrieve");
    }else{
      setState(() {
        result = resultant;
        print(result);
      });
    }
  }
  nod(String date){
    List l = date.split('/');
    final date2 = DateTime.now();
    DateTime e = DateTime(int.parse(l[2]),int.parse(l[1]),int.parse(l[0]));
    return date2.difference(e).inDays;
  }
  List result = [];
  String dropdownvalue = "30";
  List<String> items1 = ["15","30","45","60"];


  @override
  Widget build(BuildContext context) {


    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;


    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                color: const Color(0xffD9D9D9),
                height: height*10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("More than",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width*2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: width*2,),
                      DropdownButton(
                        value: dropdownvalue,
                        // icon: const Icon(Icons.keyboard_arrow_down),
                        items: items1.map((String item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item,style: TextStyle(fontSize: width*2,fontWeight: FontWeight.bold),),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                      SizedBox(width: width*2,),
                      Text("Days",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: width*2,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CList(context, result, const Color(0xffB6E2D3), Colors.green),
              ),
            ],
          ),
        ),
      ],
    );
  }


  Widget CList(BuildContext context, cdata, Color color,  Color color1){

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return  SizedBox(
      height: height*68,
      child: ListView.builder(
          itemCount: cdata.length,
          itemBuilder: (BuildContext context, int index){
            return nod(cdata[index]['orderdates'][0].toString())>=int.parse(dropdownvalue)?GestureDetector(
              onTap: (){
                Navigation.homeNavigation.currentState?.push(MaterialPageRoute(builder: (BuildContext context)=>Collection_details(details: cdata[index],)));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 0.5),
                child: Container(
                  height: height*15,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffD9D9D9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width*20,
                          alignment: Alignment.centerLeft,
                          child: Text(cdata[index]['companyname'].toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width*1.5,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height*12,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: width*20,
                          child: Text(nod(cdata[index]['orderdates'][0].toString()).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width*1.5,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey,
                          width: 2,
                          height: height*12,
                        ),
                        Container(
                          width: width*20,
                          alignment: Alignment.centerRight,
                          child: Text('Rs.${cdata[index]['openingbalance']}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width*1.5,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ):Container();
          }
      ),
    );
  }

}
