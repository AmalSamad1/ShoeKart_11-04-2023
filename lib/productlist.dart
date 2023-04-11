import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> description = [];
  List<String> name = [];
  List<String> image = [];

  Future<void> readData() async {
    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL
    var url = "https://shoes-kart-default-rtdb.firebaseio.com/"+"pruductlist.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        description.add(blogData["description"]);
        name.add(blogData["title"]);
        image.add(blogData["image"]);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
        ),
        body: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    height: 150,
                    child: Card(
                      shape: Border(
                          left: BorderSide(color: Colors.blueGrey, width: 5)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: SizedBox(
                              width: 100,
                              height: 50,

                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage('${image[index]}'),
                              ),
                            ),
                            title: Text("${name[index]}"),
                            subtitle: Text("${description[index]}"),

                          ),
                        ],
                      ),
                    ),
                  ));
            },
        )
    );
  }
}