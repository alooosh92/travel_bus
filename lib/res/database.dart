import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
CollectionReference company = db.collection('Company');
CollectionReference bus = db.collection('bus');
CollectionReference trip = db.collection('Trpis');
CollectionReference setting = db.collection('Setting');
CollectionReference personInfo = db.collection('PersonInfo');
CollectionReference booking = db.collection('Booking');

class Company {
  late String id;
  late String? name;
  late String? shortName;
  late String? color;
  late List<dynamic>? notes;
  late bool? active;
  late String? phone;

  Company(
      {required this.id,
      this.name,
      this.shortName,
      this.color,
      this.notes,
      this.active,
      this.phone});

  static Future<Company> companyId(String id) async {
    var com = await company.doc(id).get();

    return Company(
      id: com.id,
      name: com.get('name'),
      shortName: com.get('shortName'),
      color: com.get('color'),
      notes: com.get('notes'),
      active: com.get('active'),
      phone: com.get('phone'),
    );
  }

  static Future<List<Company>> allCompanyies() async {
    List<Company> companies = [];
    var data = await company.get();
    for (var com in data.docs) {
      Company c = Company(
          id: com.id,
          name: com.get('name'),
          shortName: com.get('shortName'),
          color: com.get('color'),
          notes: com.get('notes'),
          active: com.get('active'),
          phone: com.get('phone'));
      companies.add(c);
    }
    return companies;
  }

  static Future<bool> addCompany(Company newCompany) async {
    try {
      Map<String, dynamic> map = {
        'name': newCompany.name,
        'shortName': newCompany.shortName,
        'color': newCompany.color,
        'notes': newCompany.notes,
        'active': newCompany.active,
        'phone': newCompany.phone,
      };
      await company.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editCompany(Company setCompany) async {
    try {
      Map<String, dynamic> map = {
        'name': setCompany.name,
        'shortName': setCompany.shortName,
        'color': setCompany.color,
        'notes': setCompany.notes,
        'active': setCompany.active,
        'phone': setCompany.phone
      };
      await company.doc(setCompany.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Bus {
  late String id;
  late Company? company;
  late String? region;
  late String? plateNumber;
  late int? seatsNumber;
  late bool? vip;
  late bool? active;

  Bus(
      {required this.id,
      this.company,
      this.region,
      this.plateNumber,
      this.seatsNumber,
      this.vip,
      this.active});

  static Future<Bus> busId(String id) async {
    var busGet = await bus.doc(id).get();
    return Bus(
      id: busGet.id,
      company: await Company.companyId(busGet.get('company')),
      plateNumber: busGet.get('plateNumber'),
      region: busGet.get('region'),
      seatsNumber: busGet.get('seatsNumber'),
      active: busGet.get('active'),
      vip: busGet.get('vip'),
    );
  }

  static Future<List<Bus>> allBuses() async {
    List<Bus> buses = [];
    var data = await bus.get();
    for (var com in data.docs) {
      Bus c = Bus(
          id: com.id,
          company: await Company.companyId(com.get('company')),
          plateNumber: com.get('plateNumber'),
          region: com.get('region'),
          seatsNumber: com.get('seatsNumber'),
          active: com.get('active'),
          vip: com.get('vip'));
      buses.add(c);
    }
    return buses;
  }

  static Future<bool> addBus(Bus newBus) async {
    try {
      Map<String, dynamic> map = {
        'company': newBus.company!.id,
        'active': newBus.active,
        'plateNumber': newBus.plateNumber,
        'region': newBus.region,
        'seatsNumber': newBus.seatsNumber,
        'vip': newBus.vip,
      };
      await bus.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editBus(Bus setBus) async {
    try {
      Map<String, dynamic> map = {
        'company': setBus.company!.id,
        'active': setBus.active,
        'plateNumber': setBus.plateNumber,
        'region': setBus.region,
        'seatsNumber': setBus.seatsNumber,
        'vip': setBus.vip,
      };
      await bus.doc(setBus.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Trip {
  late String id;
  late Bus? bus;
  late DateTime? dateTime;
  late int? minutes;
  late double? price;
  late String? tripLine;
  late bool? full;

  Trip({
    required this.id,
    this.bus,
    this.dateTime,
    this.minutes,
    this.price,
    this.tripLine,
    this.full,
  });

  static Future<Trip> tripId(String id) async {
    var trp = await trip.doc(id).get();

    return Trip(
        id: trp.id,
        bus: Bus(id: trp.get('bus')),
        dateTime: DateTime.parse(trp.get('dateTime')),
        full: trp.get('full'),
        minutes: trp.get('minutes'),
        price: trp.get('price'),
        tripLine: trp.get('tripLine'));
  }

  static Future<List<Trip>> allTripes() async {
    List<Trip> tripes = [];
    var data = await trip.get();
    for (var com in data.docs) {
      Trip c = Trip(
          id: com.id,
          bus: Bus(id: com.get('bus')),
          dateTime: DateTime.parse(com.get('dateTime')),
          full: com.get('full'),
          minutes: com.get('minutes'),
          price: com.get('price'),
          tripLine: com.get('tripLine'));
      tripes.add(c);
    }
    return tripes;
  }

  static Future<bool> addTrip(Trip newTrip) async {
    try {
      Map<String, dynamic> map = {
        'bus': newTrip.bus!.id,
        'dateTime': newTrip.dateTime.toString(),
        'full': newTrip.full,
        'minutes': newTrip.minutes,
        'price': newTrip.price,
        'tripLine': newTrip.tripLine,
      };
      await trip.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editTrip(Trip setTrip) async {
    try {
      Map<String, dynamic> map = {
        'bus': setTrip.bus!.id,
        'dateTime': setTrip.dateTime.toString(),
        'full': setTrip.full,
        'minutes': setTrip.minutes,
        'price': setTrip.price,
        'tripLine': setTrip.tripLine
      };
      await trip.doc(setTrip.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Setting {
  late String id;
  late String? lang;
  late String? user;
  late bool? isEmployee;
  late Company? company;

  Setting(
      {required this.id, this.lang, this.user, this.company, this.isEmployee});

  static Future<Setting> settingId(String id) async {
    var com = await setting.doc(id).get();
    return Setting(
        id: com.id,
        lang: com.get('lang'),
        user: com.get('user'),
        company: Company(id: com.get('company')),
        isEmployee: com.get('isEmployee'));
  }

  static Future<bool> addSetting(Setting newSetting) async {
    try {
      Map<String, dynamic> map = {
        'lang': newSetting.lang,
        'user': newSetting.user,
        'isEmployee': newSetting.isEmployee,
        'company': newSetting.company!.id
      };
      await setting.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editSetting(Setting setSetting) async {
    try {
      Map<String, dynamic> map = {
        'lang': setSetting.lang,
        'user': setSetting.user,
        'company': setSetting.company!.id,
        'isEmployee': setSetting.isEmployee
      };
      await setting.doc(setSetting.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class PersonInfo {
  late String id;
  late String? fullName;
  late String? phone;
  late DateTime? birthday;
  late String? user;

  PersonInfo(
      {required this.id, this.fullName, this.birthday, this.phone, this.user});

  static Future<PersonInfo> personInfoId(String userId) async {
    var com = await personInfo.get();
    var c = com.docs.where((element) => element.get('user') == userId).single;
    return PersonInfo(
        id: c.id,
        birthday: DateTime.parse(c.get('birthday')),
        fullName: c.get('fullName'),
        phone: c.get('phone'),
        user: c.get('user'));
  }

  static Future<bool> addPersonInfo(PersonInfo newPersonInfo) async {
    try {
      Map<String, dynamic> map = {
        'fullName': newPersonInfo.fullName,
        'birthday': newPersonInfo.birthday.toString(),
        'phone': newPersonInfo.phone,
        'user': newPersonInfo.user,
      };
      await personInfo.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editPersonInfo(PersonInfo setPersonInfo) async {
    try {
      Map<String, dynamic> map = {
        'fullName': setPersonInfo.fullName,
        'birthday': setPersonInfo.birthday.toString(),
        'phone': setPersonInfo.phone,
        'user': setPersonInfo.user,
      };
      await personInfo.doc(setPersonInfo.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}

class Booking {
  late String id;
  late DateTime? dateTime;
  late String? fullName;
  late bool? isCheck;
  late bool? isPay;
  late int? numSeat;
  late String? phone;
  late List<int>? seatNumber;
  late Trip? trip;
  late String? user;

  Booking(
      {required this.id,
      this.dateTime,
      this.fullName,
      this.isCheck,
      this.isPay,
      this.numSeat,
      this.phone,
      this.seatNumber,
      this.trip,
      this.user});

  static Future<Booking> bookingId(String id) async {
    var bookingGet = await booking.doc(id).get();

    return Booking(
        id: bookingGet.id,
        fullName: bookingGet.get('fullName'),
        isCheck: bookingGet.get('isCheck'),
        isPay: bookingGet.get('isPay'),
        dateTime: DateTime.parse(bookingGet.get('dateTime')),
        numSeat: bookingGet.get('numSeat'),
        phone: bookingGet.get('phone'),
        seatNumber: bookingGet.get('seatNumber'),
        trip: Trip(id: bookingGet.get('trip')),
        user: bookingGet.get('user'));
  }

  static Future<List<Booking>> allBookingUser() async {
    List<Booking> bookingAll = [];
    var data = await booking.get();
    for (var com in data.docs.where((element) => element.get('user') == User)) {
      Booking c = Booking(
          id: com.id,
          fullName: com.get('fullName'),
          isCheck: com.get('isCheck'),
          isPay: com.get('isPay'),
          dateTime: DateTime.parse(com.get('dateTime')),
          numSeat: com.get('numSeat'),
          phone: com.get('phone'),
          seatNumber: com.get('seatNumber'),
          trip: com.get('trip'),
          user: com.get('user'));
      bookingAll.add(c);
    }
    return bookingAll;
  }

  static Future<List<Booking>> allBookingCompany() async {
    List<Booking> bookingAll = [];
    var data = await booking.get();
    var sett = await setting.get();
    var comp = sett.docs
        .where((element) => element.get('user') == User)
        .single
        .get('company');
    for (var com
        in data.docs.where((element) => element.get('company') == comp)) {
      Booking c = Booking(
          id: com.id,
          fullName: com.get('fullName'),
          isCheck: com.get('isCheck'),
          isPay: com.get('isPay'),
          dateTime: DateTime.parse(com.get('dateTime')),
          numSeat: com.get('numSeat'),
          phone: com.get('phone'),
          seatNumber: com.get('seatNumber'),
          trip: com.get('trip'),
          user: com.get('user'));
      bookingAll.add(c);
    }
    return bookingAll;
  }

  static Future<bool> addBooking(Booking newBooking) async {
    try {
      Map<String, dynamic> map = {
        'fullName': newBooking.fullName,
        'isCheck': newBooking.isCheck,
        'dateTime': newBooking.dateTime.toString(),
        'isPay': newBooking.isPay,
        'numSeat': newBooking.numSeat,
        'phone': newBooking.phone,
        'seatNumber': newBooking.seatNumber,
        'trip': newBooking.trip!.id,
        'user': newBooking.user
      };
      await booking.add(map);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editBooking(Booking setBooking) async {
    try {
      Map<String, dynamic> map = {
        'busNumber': setBooking.fullName,
        'isCheck': setBooking.isCheck,
        'dateTime': setBooking.dateTime.toString(),
        'isPay': setBooking.isPay,
        'numSeat': setBooking.numSeat,
        'phone': setBooking.phone,
        'seatNumber': setBooking.seatNumber,
        'trip': setBooking.trip,
        'user': setBooking.user
      };
      await booking.doc(setBooking.id).set(map);
      return true;
    } catch (e) {
      return false;
    }
  }
}
