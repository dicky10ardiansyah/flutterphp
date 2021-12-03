import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {

  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  void editData(){
    var url = "http://10.0.2.2/my_store/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
    });
  }

  @override
  void initState() {
    controllerCode = new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName = new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice = new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock = new TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Edit Data"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                    hintText: "Item Code",
                    labelText: "Item Code",
                  ),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                  ),
                ),
                new TextField(
                  controller: controllerPrice,
                  decoration: new InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                  ),
                ),
                new TextField(
                  controller: controllerStock,
                  decoration: new InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}