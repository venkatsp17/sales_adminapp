import 'package:admin_sales/FRONTEND/Homepage.dart';
import 'package:flutter/material.dart';

import 'Navigation.dart';
// import 'package:sales/FRONTEND/Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sales Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(),
      key: Navigation.appNavigation,
      initialRoute: "/",
      routes: {
        '/' : (context) => const MyHomePage(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height / 100;
    var width = size.width / 100;

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xffA09191),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              color: Color(0xffA09191),
              child: Container(
                child: Image.asset('assets/1.png'),
              ),
            ),
            // const Text(
            //   "Login",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.mail,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    width: 60,
                    height: 50,
                    child: const Icon(
                      Icons.key,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ), //C
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 600),
              child: Row(
                children: [
                  Checkbox(
                    value: remember,
                    onChanged: (bool? value) {
                      setState(() {
                        remember = value!;
                      });
                    },
                  ),
                  const Text("Remember me")
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 150,
              height: 30,
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
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
