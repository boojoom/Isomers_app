import 'package:flutter/material.dart';
import 'package:test_run/test_search.dart';


class HomePage extends StatelessWidget {
  const HomePage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF000a08),
        appBar: AppBar(leading:
        IconButton(
          icon: Transform.scale(
            scale: 1.5,
            child: Image.asset("assets/back.png"),
          ),
          onPressed: () => {Navigator.of(context).pop()} ,
        ),
          leadingWidth: 72,
          backgroundColor: Color(0xFF000a08),
          elevation: 0.0,
        ),
      body: Center(
    child: Column(
    children: <Widget>[
      const Text("Moje wyszukiwania",
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
        height: 120.0,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFF3d3b3b),
            borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          "Ta funkcjonalność jeszcze nie została wprowadzona",
          style: TextStyle(color: Color(0xFF1fb097)),
        ),
      ),
      Container(
        width: 320.0,
        height: 120.0,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFF3d3b3b),
            borderRadius: BorderRadius.circular(30.0)),
      ),
      Container(
        width: 320.0,
        height: 120.0,
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFF3d3b3b),
          borderRadius: BorderRadius.circular(30.0)),
      ),
      ElevatedButton(
          child: Icon(Icons.add,
              size: 60.0,
              color: Color(0xFF1fb097)),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SortTest()));
          },
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(2.5),
              backgroundColor: Color(0x793d3b3b),
              elevation: 15.0,
              shape: CircleBorder()),
          ),
      ],
    ),
      ),
    );
  }
}

