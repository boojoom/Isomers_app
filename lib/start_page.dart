import 'package:flutter/material.dart';
import 'package:test_run/home_page.dart';


class StartPage extends StatelessWidget {
  const StartPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000a08),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000a08),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Znajdź izomer",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 320.0,
              height: 400.0,
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 40.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xFF000a08),
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(image: AssetImage("assets/start.png"))
              ),
            ),

            ElevatedButton(
              child: Text("Zaczynamy!",
              style: TextStyle(
                color: Color(0xFF1fb097),
                  fontFamily: "Poppins",
                fontSize: 25,
              ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0x793d3b3b),
                  fixedSize: Size(200, 60),
                  elevation: 15.0,
                  shape: StadiumBorder()
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

