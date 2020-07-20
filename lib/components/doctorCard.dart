import 'package:doctors_app/models/Doctor.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {

  Doctor doctor;

  DoctorCard({this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 15,),
          Image.network("${doctor.photo}", height: 85,width: 85,),
          SizedBox(height: 10,),
          Text(
            "${doctor.name}",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 3,),
          Text(
            "${doctor.category}",
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stars, color: Colors.orange, size: 20,),
              Text(" ${doctor.score} ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
              Text(" (${doctor.reviewCount} Reviews) ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.grey.shade700),),
            ],
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      elevation:
          2.0, // this field changes the shadow of the card 1.0 is default
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)),
    );
  }
}