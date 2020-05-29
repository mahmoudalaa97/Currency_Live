import 'package:curranceyLive/constatnt.dart';
import 'package:flutter/material.dart';

import 'controller/api_service.dart';
import 'model/bank_data.dart';
import 'model/bank_data.dart';
import 'model/bank_data.dart';
import 'model/bank_data.dart';
import 'model/bank_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Define this class and make object to use fetch Bank Data method
  ApiService _apiService = ApiService();

  List<BankData> data=[];
  String type="USD";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_drop_down),
                    Text("اختار العملة",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14),),
                  ],
                ),
              )),
              onSelected: (value) {
          setState(() {
            type=value;
            _getData(currency: type);
          });
              },
              itemBuilder: (BuildContext context) {
              return currencyType.map((value) =>   PopupMenuItem(
                value: value,
                child: Text(value),
              )).toList();
              },
            ),
          ],
          title: Text("العملات مباشر",style: Theme.of(context).appBarTheme.textTheme.headline1,),
          centerTitle: true,
        ),
        body: _cardDataList(data));
  }

  Widget _cardDataList(List<BankData> data) {
    return data.length != 0?RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 5, top: 5, right: 5),
              width: double.infinity,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).primaryColor,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(color: Colors.green,shape: BoxShape.circle),
                            child: Center(child: Text(data[index].currencyCode,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
                          ),

                            Text(
                              "${data[index].name}",
                              style: Theme.of(context).textTheme.headline1,
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
          }),
    ): Center(child: CircularProgressIndicator());
  }

  Widget _detailsOfDollar({title, value}) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            "$title",
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Card(
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

  Future<void> _refreshData() async {
    setState(() {
      _getData(currency: type);
    });
  }

  void _getData({String currency="USD"}) async{
    BankDataList value=await  _apiService.fetchBankData(currency: currency);

 setState(() {
   if(value!=null){
     data=value.data;
     data.sort((a,b)=>b.buy.compareTo(a.buy));
   }
 });
  }
}
