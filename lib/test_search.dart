import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SortTest extends StatefulWidget {

  @override
  State<SortTest> createState() => _SortTestState();
}

class _SortTestState extends State<SortTest> {


  @override
  void initState() {
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }

  _onSearchChanged() {
    print(_searchController.text);
    searchResultList();
  }

  searchResultList(){
    var showResults = [];
    if(_searchController.text != ""){

      for (var clientSnapShot in _allResults)
      {
        var name = clientSnapShot['structure'].toString().toLowerCase();
        if(name.contains(_searchController.text.toLowerCase())){
          showResults.add(clientSnapShot);
        }
      }

    }
    else{
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultList = showResults;
    });
  }

  List _allResults = [];
  List _resultList = [];
  final TextEditingController _searchController = TextEditingController();

  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection('compounds').orderBy(
        'structure').get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultList();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    getClientStream();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF000a08),
        appBar: AppBar(
          leading:
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
        body: Padding(
          padding:EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 67.0,
              ),
              TextField(
                controller: _searchController,
                onChanged: (value) => _onSearchChanged(),
                style: TextStyle(color: Color(0xFFe3d35a)),
                decoration: InputDecoration(
                  filled:true,
                  fillColor: Color(0xFF3d3b3b),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Wyszukaj",
                  hintStyle: const TextStyle(color: Color(0xFF1fb097),
                  fontSize: 20.0),
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Color(0xFF1fb097),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child:
              ListView.builder(
                  itemCount: _resultList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Transform.scale(
                        scale: 0.5,
                        child: Image.asset("assets/atom_icon.png"),
                      ),
                      title: Text(
                        _resultList[index] ["name"],
                        style: const TextStyle(color: Colors.white)),
                        trailing: Text(
                          _resultList[index] ["structure"],
                          style: const TextStyle(color: Colors.white),
                        )
                    );
                  },
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
