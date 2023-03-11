import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map<String, String> header = {
  "Content-Type": "application/json",
  "Accept": "text/plain",
};

String hostting = "http://travelcompany-001-site1.htempurl.com/api/trip/";
Uri getAllRegion = Uri.parse('${hostting}getregion');
Uri getTripUser = Uri.parse('${hostting}GetTripUser');
Uri getTripCompany = Uri.parse('${hostting}GetTripCompany');
Uri getPersonInfoId = Uri.parse('${hostting}GetPersonInfoId');
Uri getBusCompany = Uri.parse('${hostting}GetBusCompany');
Uri getBookingCompany = Uri.parse('${hostting}GetBookingCompany');
Uri getBookingUser = Uri.parse('${hostting}GetBookingUser');
Uri postBookingUser = Uri.parse('${hostting}PostBookingUser');
Uri postBookingCompany = Uri.parse('${hostting}PostBookingCompany');
Uri postBuses = Uri.parse('${hostting}PostBuses');
Uri postCompany = Uri.parse('${hostting}PostCompany');
Uri postPerson = Uri.parse('${hostting}PostPerson');
Uri postTip = Uri.parse('${hostting}PostTip');
Uri updateBookingUser = Uri.parse('${hostting}UpdateBookingUser');
Uri updateBookingCompany = Uri.parse('${hostting}UpdateBookingCompany');
Uri updateBus = Uri.parse('${hostting}UpdateBus');
Uri updateCompany = Uri.parse('${hostting}UpdateCompany');
Uri updatePersonInfo = Uri.parse('${hostting}UpdatePersonInfo');
Uri updateTip = Uri.parse('${hostting}UpdateTip');
Uri deleteBooking = Uri.parse('${hostting}DeleteBooking');

class Region {
  late String id;
  late String arRegion;
  late String enRegion;

  Region({required this.id, required this.arRegion, required this.enRegion});

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      arRegion: json['arRegion'],
      enRegion: json['enRegion'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'arRegion': arRegion, 'enRegion': enRegion};
}

class TripUser {
  late String id;
  late String shortName;
  late String busLine;
  late DateTime dateTime;
  late String color;
  late List<String> note;
  late bool vip;
  late double price;
  late int minutes;

  TripUser(
      {required this.id,
      required this.busLine,
      required this.dateTime,
      required this.color,
      required this.note,
      required this.shortName,
      required this.vip,
      required this.minutes,
      required this.price});

  factory TripUser.fromJson(Map<String, dynamic> json) {
    List<String> no = [];
    for (var element in json['notes']) {
      no.add(element);
    }
    return TripUser(
        id: json['id'],
        busLine: json['busLine'],
        dateTime: DateTime.parse(json['dateTime']),
        color: json['color'],
        note: no,
        shortName: json['shortName'],
        vip: json['vip'],
        minutes: json['minutes'],
        price: double.parse(json['price'].toString()));
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'busLine': busLine,
        'dateTime': dateTime,
        'color': color,
        'notes': note,
        'shortName': shortName,
        'vip': vip,
        'price': price,
        'minutes': minutes
      };
}

class PersonInfo {
  late String nationalNumber;
  late String firstName;
  late String lastName;
  late String fatherName;
  late String motherName;
  late String amana;
  late String kayed;
  late bool sex;
  late String phone;
  late DateTime birthDay;
  late Region region;

  PersonInfo(
      {required this.nationalNumber,
      required this.firstName,
      required this.lastName,
      required this.fatherName,
      required this.motherName,
      required this.amana,
      required this.kayed,
      required this.sex,
      required this.phone,
      required this.birthDay,
      required this.region});

  factory PersonInfo.fromJson(Map<String, dynamic> json) {
    return PersonInfo(
      nationalNumber: json['nationalNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      fatherName: json['fatherName'],
      motherName: json['motherName'],
      amana: json['amana'],
      kayed: json['kayed'],
      sex: json['sex'],
      phone: json['phone'],
      birthDay: DateTime.parse(json['birthDay']),
      region: Region.fromJson(json['region']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nationalNumber': nationalNumber,
        'firstName': firstName,
        'lastName': lastName,
        'fatherName': fatherName,
        'motherName': motherName,
        'amana': amana,
        'kayed': kayed,
        'sex': sex,
        'phone': phone,
        'birthDay': birthDay,
        'region': region.toJson(),
      };
}

class PersonData {
  late String? nationalNumber;
  late String? firstName;
  late String? lastName;
  late String? fatherName;
  late String? motherName;
  late String? amana;
  late String? kayed;
  late bool? sex;
  late String? phone;
  late DateTime? birthDay;
  late String? region;
  late String? userId;

  PersonData({
    required this.amana,
    required this.birthDay,
    required this.fatherName,
    required this.firstName,
    required this.kayed,
    required this.lastName,
    required this.motherName,
    required this.nationalNumber,
    required this.phone,
    required this.region,
    required this.sex,
    required this.userId,
  });

  Map<String, dynamic> toJson() => {
        'amana': amana,
        'birthDay': birthDay.toString(),
        'fatherName': fatherName,
        'firstName': firstName,
        'kayed': kayed,
        'lastName': lastName,
        'motherName': motherName,
        'nationalNumber': nationalNumber,
        'phone': phone,
        'region': region,
        'sex': sex,
        'userId': userId
      };
}

class BookingUser {
  late String id;
  late DateTime dateTimeBooking;
  late DateTime dateTimeTravel;
  late String color;
  late String shortName;
  late int seateNumber;
  late List<int> seates;
  late bool isPay;
  late bool isCheck;
  late String busNumber;
  late String from;
  late String to;
  late int price;
  late bool vip;

  BookingUser(
      {required this.id,
      required this.dateTimeBooking,
      required this.dateTimeTravel,
      required this.color,
      required this.shortName,
      required this.seateNumber,
      required this.seates,
      required this.isPay,
      required this.isCheck,
      required this.busNumber,
      required this.from,
      required this.price,
      required this.to,
      required this.vip});

  factory BookingUser.fromJson(Map<String, dynamic> json) {
    List<int> sss = [];
    for (var ss in json['seates']) {
      sss.add(ss);
    }
    return BookingUser(
      id: json['id'],
      dateTimeBooking: DateTime.parse(json['dateTimeBooking']),
      dateTimeTravel: DateTime.parse(json['dateTimeTravel']),
      color: json['color'],
      shortName: json['shortName'],
      seateNumber: json['seateNumber'],
      seates: sss,
      isPay: json['isPay'],
      isCheck: json['isCheck'],
      busNumber: json['busNumber'],
      from: json['from'],
      price: json['price'] as int,
      to: json['to'],
      vip: json['vip'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'dateTimeBooking': dateTimeBooking,
        'dateTimeTravel': dateTimeTravel,
        'color': color,
        'shortName': shortName,
        'seateNumber': seateNumber,
        'seates': seates,
        'isPay': isPay,
        'isCheck': isCheck,
        'busNumber': busNumber,
        'from': from,
        'to': to,
        'price': price,
        'vip': vip,
      };
}

class BookingPostUser {
  late String? note;
  late String? userId;
  late int? numSeate;
  late String? tripId;
  late String? personId;

  BookingPostUser(
      {required this.note,
      required this.numSeate,
      required this.personId,
      required this.tripId,
      required this.userId});

  Map<String, dynamic> toJson() => {
        'note': note,
        'numSeate': numSeate,
        'personId': personId,
        'tripId': tripId,
        'userId': userId
      };

  factory BookingPostUser.fromJson(Map<String, dynamic> json) {
    return BookingPostUser(
      note: '',
      numSeate: 0,
      personId: '',
      tripId: '',
      userId: '',
    );
  }
}

class Controller {
  static Future<List<Region>> allRegion() async {
    List<Region> regiones = [];
    http.Response response = await http.get(getAllRegion);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        regiones.add(Region.fromJson(element));
      }
    }
    return regiones;
  }

  static Future<List<TripUser>> tripUser() async {
    List<TripUser> booking = [];
    http.Response response = await http.get(getTripUser);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body) {
        booking.add(TripUser.fromJson(element));
      }
    }
    return booking;
  }

  static Future<PersonInfo> personInfo(String id) async {
    PersonInfo personInfo = PersonInfo(
      nationalNumber: '',
      amana: '',
      birthDay: DateTime.now(),
      fatherName: '',
      firstName: '',
      kayed: '',
      lastName: '',
      motherName: '',
      phone: '',
      region: Region(arRegion: '', enRegion: '', id: ''),
      sex: true,
    );
    http.Response response =
        await http.get(Uri.parse('${getPersonInfoId.toString()}/?id=$id'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      personInfo = PersonInfo.fromJson(body);
    }
    return personInfo;
  }

  static Future<List<BookingUser>> bookingUser(String userId) async {
    List<BookingUser> bookingUser = [];
    http.Response response = await http
        .get(Uri.parse('${getBookingUser.toString()}?userid=$userId'));
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var book in body) {
        bookingUser.add(BookingUser.fromJson(book));
      }
    }
    return bookingUser;
  }

  static Future<bool> addPerson(PersonData personData) async {
    http.Response response = await http.post(postPerson,
        headers: header, body: jsonEncode(personData.toJson()));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> addBooking(BookingPostUser bookingPostUser) async {
    http.Response response = await http.post(postBookingUser,
        headers: header, body: jsonEncode(bookingPostUser.toJson()));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
