import 'dart:typed_data';
import 'package:csafe_fitness/csafe_fitness.dart';

extension Concept2DateExtension on DateTime {
  static DateTime fromBytes(Uint8List bytes) {
    int date = CsafeIntExtension.fromBytes(
        bytes.sublist(0, 2)); //, endian: Endian.little);

    int month = date & 0x0F;
    int day = (date >> 4) & 0x1F;
    int year = (date >> 9) & 0x7f;

    int minutes = CsafeIntExtension.fromBytes(
        bytes.sublist(2, 3)); //, endian: Endian.little);
    int hours = CsafeIntExtension.fromBytes(
        bytes.sublist(3, 4)); //, endian: Endian.little);

    return DateTime(year + 2000, month, day, hours, minutes);
  }

  Uint8List toBytes() {
    List<int> bytes = [];

    // int yearoffset = (year - 2000);
    // bytes.add( (day & 0x0F)<<4 | month & 0x0F);

    // int day_year_byte = (day & 0x1F) | ;

    return Uint8List.fromList(bytes);
  }
}
