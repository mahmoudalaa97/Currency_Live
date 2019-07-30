import 'package:flutter/material.dart';

import 'controller/api_service.dart';
import 'model/bank_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Define this class and make object to use fetch Bank Data method
  ApiService _apiService = ApiService();

  //Text Style this Name of Bank
  TextStyle _textStyleTitle =
      TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);

  //Text Style this use sub Title (buy,sell,last_update)
  TextStyle _textStyleSubTitle =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الدولار مباشر"),
          centerTitle: true,
          backgroundColor: Color(0xff364788),
        ),
        body: FutureBuilder<BankDataList>(
          future: _apiService.fetchBankData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //If Has Data
              return _cardDataList(snapshot.data.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget _cardDataList(List<BankData> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 5, top: 5, right: 5),
            width: double.infinity,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Color(0xff0d3f67),
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/dollar_ic.png",
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            "${data[index].name}",
                            style: _textStyleTitle,
                          ),
                          Image.network(
                            "${data[index].logo}",
                            width: 35,
                            height: 35,
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          _detailsOfDollar(
                              title: "شراء", value: data[index].buy),
                          _detailsOfDollar(
                              title: "بيع", value: data[index].sell),
                          _detailsOfDollar(
                              title: "الحركة في البنك/لدينا",
                              value: data[index].lastUpdate),
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }

  Widget _detailsOfDollar({title, value}) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            "$title",
            style: _textStyleSubTitle,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Card(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
              child: Text("$value"),
            ),
          ),
        )
      ],
    );
  }
}
