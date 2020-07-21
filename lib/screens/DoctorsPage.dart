import 'dart:convert';

import 'package:doctors_app/components/doctorCard.dart';
import 'package:doctors_app/models/Doctor.dart';
import 'package:doctors_app/networks/DoctorsOperations.dart';
import 'package:doctors_app/screens/DoctorDetailPage.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatefulWidget {
  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  List<Doctor> doctorsList;

  DoctorsOperations doctorsOperations;

  @override
  void initState() {
    super.initState();

    // If you run this line, data comes from dummy data.
    doctorsList = new Doctor().getDummyDoctorsList();

    // If you run this line, data comes from mongodb database
    doctorsOperations = new DoctorsOperations();
    doctorsOperations.getAll().then((value) {
      print(value);
    });
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
        doctorsList.length == 0 ? _showLoadingBar() : _doctorsGrid(),
      ],
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 0),
      child: TextField(
        onChanged: (value) {
          if (value == "") {
            setState(() {
              doctorsList = new Doctor().getDummyDoctorsList();
            });
          } else {
            setState(() {
              doctorsList = doctorsList
                  .where((element) => element.name.contains(value))
                  .toList();
            });
          }
        },
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
        physics: ClampingScrollPhysics(),
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

  Widget _showLoadingBar() {
    return Center(
      heightFactor: 8,
      child: SizedBox(
    height: 50.0,
    width: 50.0,
    child: 
        CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.black),
        strokeWidth: 2.0)
    ),
    );
  }
}
