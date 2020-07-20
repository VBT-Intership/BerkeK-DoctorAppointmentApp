import 'package:doctors_app/components/doctorCard.dart';
import 'package:doctors_app/models/Doctor.dart';
import 'package:doctors_app/screens/DoctorDetailPage.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  List<Doctor> doctorsList;

  @override
  void initState() {
    super.initState();
    doctorsList = new List<Doctor>();
    doctorsList.add(new Doctor(
        id: "1",
        name: "Dr. Berke K",
        category: "Beyin Cerrahı",
        score: "4.5",
        reviewCount: "135",
        photo:
            "https://i.pinimg.com/originals/65/53/20/655320b0cb1ffc68630b7f2cbab0af59.png"));
    doctorsList.add(new Doctor(
        id: "2",
        name: "Dr. Aslı B",
        category: "Göz Doktoru",
        score: "5.0",
        reviewCount: "112",
        photo:
            "https://ffpcwakeforest.com/wp-content/uploads/2015/05/doctor-circle.png"));
    doctorsList.add(new Doctor(
        id: "3",
        name: "Dr. Aycan C",
        category: "Beyin Cerrahı",
        score: "4.5",
        reviewCount: "126",
        photo:
            "https://d3wnzga3fpd9a.cloudfront.net/photos/Dr-Roaj-Ujjin-MD-250584-circle_large__v1__.png"));
    doctorsList.add(new Doctor(
        id: "4",
        name: "Dr. Ali B",
        category: "İç Hastalıkları",
        score: "3.5",
        reviewCount: "85",
        photo:
            "https://ffpcwakeforest.com/wp-content/uploads/2015/05/doctor-circle.png"));
    doctorsList.add(new Doctor(
        id: "5",
        name: "Dr. Hasan A",
        category: "Üroloji",
        score: "4.5",
        reviewCount: "81",
        photo:
            "https://i.pinimg.com/originals/65/53/20/655320b0cb1ffc68630b7f2cbab0af59.png"));
    doctorsList.add(new Doctor(
        id: "6",
        name: "Dr. Hasan A",
        category: "Beyin Cerrahı",
        score: "2.8",
        reviewCount: "142",
        photo:
            "https://d3wnzga3fpd9a.cloudfront.net/photos/Dr-Roaj-Ujjin-MD-250584-circle_large__v1__.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  Widget _createAppBar() {
    return AppBar(
        backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
        title: Text(
          "Doctors",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.event_available,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
            size: 30,
          ),
        ));
  }

  Widget _createBody() {
    return ListView(
      children: [
        _searchBar(),
        _doctorsGrid(),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 0),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            hintText: "Search for doctors",
            prefixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  Widget _doctorsGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: doctorsList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorDetailPage(doctorsList[index])),
              );
            },
            child: DoctorCard(
              doctor: doctorsList[index],
            ),
          );
        },
      ),
    );
  }
}
