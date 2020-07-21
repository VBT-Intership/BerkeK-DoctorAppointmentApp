import 'package:mongo_dart/mongo_dart.dart';

class DoctorsOperations {

  String mongoConnectionUrl = "mongodb://10.0.2.2/doctor-appointment-app-database";
  String collectionName = "doctors";

  /// This function get all doctors list
  Future<dynamic> getAll() async {
    Db db = new Db("$mongoConnectionUrl");
    await db.open();
    var list = [];
    await db.collection('$collectionName').find().forEach((element) {
      list.add(element);
    });
    return list;
  }

  /*
  /// This function add dummy data to your database
  Future<bool> addData() async {
    Db db = new Db("$mongoConnectionUrl");
    await db.open();
    await db.collection("$collectionName").insertAll([
      {
        'name': 'Dr. Berke K',
        'category': 'Beyin Cerrahı',
        'score': '4.5',
        'reviewCount': '135',
        'photo':
            'https://i.pinimg.com/originals/65/53/20/655320b0cb1ffc68630b7f2cbab0af59.png'
      },
      {
        'name': 'Dr. Aslı B',
        'category': 'Göz Doktoru',
        'score': '3.5',
        'reviewCount': '28',
        'photo':
            'https://ffpcwakeforest.com/wp-content/uploads/2015/05/doctor-circle.png'
      },
      {
        'name': 'Dr. Aycan C',
        'category': 'İç Hastalıkları',
        'score': '2.7',
        'reviewCount': '64',
        'photo':
            'https://d3wnzga3fpd9a.cloudfront.net/photos/Dr-Roaj-Ujjin-MD-250584-circle_large__v1__.png'
      },
      {
        'name': 'Dr. Ali B',
        'category': 'Beyin Cerrahı',
        'score': '3.8',
        'reviewCount': '123',
        'photo':
            'https://ffpcwakeforest.com/wp-content/uploads/2015/05/doctor-circle.png'
      },
      {
        'name': 'Dr. Hasan A',
        'category': 'İç Hastalıkları',
        'score': '4.2',
        'reviewCount': '86',
        'photo':
            'https://i.pinimg.com/originals/65/53/20/655320b0cb1ffc68630b7f2cbab0af59.png'
      },
      {
        'name': 'Dr. Berke K',
        'category': 'Göz Doktoru',
        'score': '5.0',
        'reviewCount': '12',
        'photo':
            'https://d3wnzga3fpd9a.cloudfront.net/photos/Dr-Roaj-Ujjin-MD-250584-circle_large__v1__.png'
      }
    ]);
    return true;
  }
  */
}
