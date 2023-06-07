import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

int? floatToInt(double num) {
  return num.toInt();
}

List<String> stringToArr(String val) {
  return [val];
}

int? parseIntFromString(String? value) {
  return value == null ? null : int.tryParse(value);
}

double? parseDoubleFromString(String? value) {
  return value == null ? null : double.tryParse(value);
}

List<QuestionStruct> questionToArr(QuestionStruct val) {
  return [val];
}

int unixTrunc(
  int unixTimestamp,
  int? trunc,
) {
  trunc ??= 60 * 60; //defaults to 1hr
  return (unixTimestamp ~/ trunc) * trunc;
}

String capitalize(String val) {
  return "${val[0].toUpperCase()}${val.substring(1).toLowerCase()}";
}

String dateToMonthsAgo(
  DateTime date,
  int? maxMonths,
  String? lang,
) {
  maxMonths ??= 2;
  lang ??= 'en';

  String thisMonth() {
    switch (lang) {
      case 'es':
        return "Este mes";
      case 'en':
      default:
        return "This month";
    }
  }

  String lastMonth() {
    switch (lang) {
      case 'es':
        return "El mes pasado";
      case 'en':
      default:
        return "Last month";
    }
  }

  String monthsAgo(int mos) {
    switch (lang) {
      case 'es':
        return "Hace $mos meses";
      case 'en':
      default:
        return "$mos months ago";
    }
  }

  DateTime today = DateTime.now();
  int diffInMonths = (today.year - date.year) * 12 + (today.month - date.month);
  if (diffInMonths <= maxMonths && maxMonths != 0) {
    if (diffInMonths == 0) return thisMonth();
    if (diffInMonths == 1) return lastMonth();
    return monthsAgo(diffInMonths);
  }
  String pattern = today.year == date.year ? "MMMM" : "MMMM y";
  Intl.systemLocale = lang;
  return capitalize(DateFormat(pattern).format(date));
}

DateTime addMonths(
  DateTime initialDate,
  int? months,
) {
  months ??= 1;

  DateTime newDate =
      DateTime(initialDate.year, initialDate.month + months, initialDate.day);

  // Handle cases where the resulting month exceeds December
  if (newDate.month > 12) {
    int overflowYears = (newDate.month - 1) ~/ 12;
    newDate =
        DateTime(newDate.year + overflowYears, newDate.month % 12, newDate.day);
  }

  return newDate;
}

String customDateFormat(
  DateTime date,
  String pattern,
  String lang,
) {
  Intl.systemLocale = lang;
  return capitalize(DateFormat(pattern).format(date));
}
