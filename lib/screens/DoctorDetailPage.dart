import 'package:doctors_app/models/Doctor.dart';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatefulWidget {
  Doctor doctor;

  DoctorDetailPage(this.doctor);

  @override
  _DoctorDetailPageState createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromRGBO(245, 246, 250, 1.0),
      backgroundColor: Colors.white,
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

  Widget _createAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        elevation: 0,
        bottomOpacity: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                color: Colors.black,
                size: 30,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )));
  }

  Widget _createBody() {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        _doctorImage(),
        SizedBox(
          height: 20,
        ),
        _doctorName(),
        SizedBox(
          height: 5,
        ),
        _doctorCategory(),
        SizedBox(
          height: 10,
        ),
        _doctorProperties(),
        SizedBox(
          height: 25,
        ),
        _doctorAbout(),
        SizedBox(
          height: 20,
        ),
        _doctorWorking(),
        SizedBox(
          height: 20,
        ),
        _doctorCommunications(),
        SizedBox(
          height: 20,
        ),
        _doctorBookButton(),
      ],
    );
  }

  Widget _doctorImage() {
    return Image.network(
      "${widget.doctor.photo}",
      height: 100,
      width: 100,
    );
  }

  Widget _doctorName() {
    return Text(
      "${widget.doctor.name}",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    );
  }

  Widget _doctorCategory() {
    return Text(
      "${widget.doctor.category}",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );
  }

  Widget _doctorProperties() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _widgetDoctorProperty(
            Icon(Icons.people, color: Colors.blue,), Colors.blue.shade100, "1000+", "Patiens"),
        _widgetDoctorProperty(Icon(Icons.bookmark_border, color: Colors.red,), Colors.red.shade100,
            "10 Yrs", "Experience"),
        _widgetDoctorProperty(Icon(Icons.star_border, color: Colors.orange,), Colors.orange.shade100,
            "${widget.doctor.score}", "Ratings"),
      ],
    );
  }

  Widget _doctorAbout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Doctor",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _doctorWorking() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Working Time",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Monday - Saturday (08:30 AM - 09:30 PM)",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _doctorCommunications() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Communication",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          _widgetCommunicationProperty(
              "Messaging",
              "Chat me up, share photos",
              Colors.pink.shade100,
              Icon(
                Icons.message,
                color: Colors.pink,
              )),
          SizedBox(
            height: 12,
          ),
          _widgetCommunicationProperty(
              "Audio Call",
              "Chat me up, share photos",
              Colors.blue.shade100,
              Icon(
                Icons.phone,
                color: Colors.blue,
              )),
          SizedBox(
            height: 12,
          ),
          _widgetCommunicationProperty(
              "Video Call",
              "Chat me up, share photos",
              Colors.orange.shade100,
              Icon(
                Icons.camera_alt,
                color: Colors.orange,
              )),
        ],
      ),
    );
  }

  Widget _doctorBookButton() {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Text(
            "Book Appoinment",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          color: Color.fromRGBO(46, 204, 113, 1.0),
        ),
      ),
    );
  }

  Widget _widgetDoctorProperty(
      Icon icon, Color color, String title, String subtitle) {
    return Container(
      width: 125,
      child: Card(
        elevation: 1.0,
        child: Column(
          children: [
            Container(
              height: 60,
              width: 40,
              color: color,
              child: icon,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: Text(
                "$title",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              "$subtitle",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _widgetCommunicationProperty(
      String title, String subtitle, Color color, Icon icon) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(15)),
              height: 50,
              child: icon,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  $title",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
                Text(
                  "   $subtitle",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
