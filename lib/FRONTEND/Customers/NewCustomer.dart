import 'package:admin_sales/FRONTEND/Customers/stepper1.dart';
import 'package:admin_sales/FRONTEND/Customers/stepper2.dart';
import 'package:admin_sales/FRONTEND/Customers/stepper3.dart';
import 'package:flutter/material.dart';
import '../../Backend/Customersb.dart';
import '../../Navigation.dart';
import '../Orders/NewOrder.dart';
import 'my-globals.dart' as globals;

class Newcustomer extends StatefulWidget {
  const Newcustomer({Key? key}) : super(key: key);

  @override
  State<Newcustomer> createState() => _NewcustomerState();

}

class _NewcustomerState extends State<Newcustomer> {


  final Customersb obb = Customersb();
  int currentstep = 0;
  List<Step> getSteps()=>[
    Step(state:currentstep>0?StepState.complete:StepState.indexed,isActive:currentstep>=0,title: Text('STEP - 1'), content: stepper1()),
    Step(state:currentstep>1?StepState.complete:StepState.indexed,isActive:currentstep>=1,title: Text('STEP - 2'), content: stepper2()),
    Step(state:currentstep>2?StepState.complete:StepState.indexed,isActive:currentstep>=2,title: Text('STEP - 3'), content: stepper3()),
  ];
  String result ="";



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height/100;
    var width = size.width/100;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(onPressed: (){
              Navigation.homeNavigation.currentState?.pop();
            }, icon: const Icon(Icons.close))
          ],
        ),
        Container(
          height: height * 87,
          width: width * 87.5,
          child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(primary: Colors.cyan)),
            child: Stepper(
              currentStep: currentstep,
              type: StepperType.horizontal,
                steps: getSteps(),
              onStepContinue: () {
                setState(() {
                  if(currentstep==2){
                    print("Completed");
                  }
                  else{
                    currentstep += 1;
                  }
                });
              },
              onStepCancel: (){
                setState(() {
                 if(currentstep==0){

                 }
                 else{
                   currentstep -= 1;
                 }
                });
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return currentstep==2?Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 145,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.cyan
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  )
                              ),
                              onPressed: ()async{
                                dynamic res = await obb.createcustomer(globals.id, globals.type, globals.pc, globals.cmpname, globals.cdname, globals.cph, globals.gst, globals.bname, globals.accno, globals.ifsc, globals.brname, globals.pan, globals.add, globals.country, globals.state, globals.city, globals.pin, globals.opb, globals.pterms, globals.name, globals.mobno);
                                setState(() {
                                  result = res;
                                });
                                if(result=="200"){
                                  var snackBar = const SnackBar(content: Text('Customer Created'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                                else{
                                  var snackBar = const SnackBar(content: Text('Error'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              },
                              child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                          ),
                          SizedBox(
                            width: 145,
                            height: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.cyan
                                  ),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  )
                              ),
                              onPressed: details.onStepCancel,
                              child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.cyan
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              )
                          ),
                          onPressed: (){
                            Navigation.homeNavigation.currentState?.pushReplacementNamed('/home/neworder');
                          },
                          child: const Text("Save & Order", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,)
                  ],
                ):Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.cyan
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                )
                            ),
                            onPressed: details.onStepContinue,
                            child: const Text("Next", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.cyan
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )
                                )
                            ),
                            onPressed: details.onStepCancel,
                            child: const Text("Cancel", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,)
                  ],
                );
              },
          ),
            ),
        ),
      ],
    );
  }
}
