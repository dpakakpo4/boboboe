import 'package:boboboe/models/countriesData.dart';
import 'package:boboboe/models/countryModel.dart';
import 'package:boboboe/models/covidAPi.dart';
import 'package:boboboe/models/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CountryModel> countries = new List<CountryModel>();
  Global covidApiGlobal = new Global();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    countries = getCountries();
  }

  getGlobaData() async {
    CovidApi covidApi = new CovidApi();
    await covidApi.getGlobalData();
    covidApiGlobal = covidApi.global;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "Covid19",
            style: TextStyle(color: Colors.blueGrey[900]),
          ),
          Text("Tracker", style: TextStyle(color: Colors.amber)),
        ]),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return CountryTile(
                    name: countries[index].name,
                    imgUrl: countries[index].imgUrl,
                  );
                },
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.amber[800],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        color: Colors.blue,
                        height: 100,
                        width: 180,
                        child: Stack(
                          children: <Widget>[],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: Stack(
                          children: <Widget>[],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        color: Colors.blue,
                        height: 100,
                        width: 110,
                        child: Stack(
                          children: <Widget>[],
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 180,
                        child: Stack(
                          children: <Widget>[],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryTile extends StatelessWidget {
  final name;
  final imgUrl;
  CountryTile({this.name, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl, width: 120, height: 60)),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
