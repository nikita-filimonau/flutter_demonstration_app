import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';

List<String> enumToStringList(enumList) {
  return enumList.values.map((String item) => describeEnum(item));
}

T? stringToEnum<T>(Iterable<T> enumValues, String string) {
  return enumValues.firstWhereOrNull((item) => describeEnum(item!) == string);
}

String enumToString<T>(T property) {
  return describeEnum(property!);
}

List<T?> stringListToEnumList<T>(Iterable<T> enumValues, List<String> list) {
  return list.map((String item) => stringToEnum(enumValues, item)).toList();
}
