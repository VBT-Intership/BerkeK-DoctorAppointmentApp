class Doctor {
  String id;
  String name;
  String category;
  String score;
  String reviewCount;
  String photo;

  Doctor(
      {this.id,
      this.name,
      this.category,
      this.score,
      this.reviewCount,
      this.photo});

  List<Doctor> getDummyDoctorsList() {
    List<Doctor> doctorsList = new List<Doctor>();
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
    return doctorsList;
  }
}
