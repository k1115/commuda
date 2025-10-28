import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? getGoneTime(DateTime? time) {
  // input time and return gone time from current time by format like this 1月2日3時30分. if 月とか日とか時とかが0であれば、表示しない。
  if (time == null) return null;
  final now = DateTime.now();
  final difference = now.difference(time);

  final months = difference.inDays ~/ 30;
  final days = difference.inDays % 30;
  final hours = difference.inHours % 24;
  final minutes = difference.inMinutes % 60;

  if (months > 0) return '${months}月前';
  if (days > 0) return '${days}日前';
  if (hours > 0) return '${hours}時前';
  return '${minutes}分前';
}

int getStringLength(String? string) {
  // get string length
  // Return the length of the string or 0 if the string is null
  return string?.length ?? 0;
}

int? getPaddingSize(int? index) {
  // return index * 15
// Return index multiplied by 15
  return index != null ? index * 15 : null;
}

int? getPoints(List<PointsRow>? points) {
  if (points == null) return 0;

  int sum = 0;
  for (var row in points) {
    sum += row.point ?? 0;
  }
  return sum;
}

DateTime? getYesterday() {
  // get yesterday and return it
  return DateTime.now().subtract(Duration(days: 1));
}

String? generatePasswordString(int? length) {
  // input length and return string that has length with all ⚫︎
  if (length == null || length <= 0) return null;
  return List.filled(length, '⚫︎').join();
}

DateTime getStartTime(DateTime? dateTime) {
  // input dateTime and return dateTime's 0:00:00 in local timezone
  if (dateTime == null) {
    return DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
  }
  // Convert UTC to local time before resetting time components
  return dateTime.copyWith(hour: 0, minute: 0, second: 0).toLocal();
}

DateTime getLastTime(DateTime? dateTime) {
  // input dateTime and return dateTime's 0:00:00 in local timezone
  if (dateTime == null) {
    return DateTime.now().copyWith(hour: 23, minute: 59, second: 59);
  }
  // Convert UTC to local time before resetting time components
  return dateTime.copyWith(hour: 23, minute: 59, second: 59).toLocal();
}

bool checkMessage(
  String searchText,
  String? lastMessage,
  List<String> names,
  String myName,
) {
  final safeMessage = lastMessage ?? '';
// input searchText, lastMessage, names, myName String and identify if (lastMessage contains searchText) or (names without myName contains searchText)
  return safeMessage.contains(searchText) ||
      names
          .where((name) => name != myName)
          .any((name) => name.contains(searchText));
}

bool checkCommunity(
  List<String>? categroies,
  String? name,
  String? searchText,
) {
  // if searchText is null, return true, if name contains searchText or categories member contains searchText, return true.
  if (searchText == null) return true; // If searchText is null, return true
  if (name != null && name.contains(searchText))
    return true; // Check if name contains searchText
  if (categroies != null &&
      categroies.any((category) => category.contains(searchText)))
    return true; // Check if any category contains searchText
  return false; // Return false if none of the conditions are met
}

String? getImagePath(String? imagePath) {
  // Return imagePath if non-null and non-empty, otherwise null
  if (imagePath != null && imagePath.isNotEmpty) {
    return imagePath;
  }
  return null;
}

DateTime getSafeDateTime(DateTime? dateTime) {
  // input datetime and if null, return 2000:01:01 00:00:00 else return itself
  return dateTime ?? DateTime(2000, 1, 1, 0, 0, 0);
}

bool hasMember(
  List<int>? arrary,
  int? number,
) {
  // return if array contains number
  if (arrary == null || number == null) {
    return false;
  }
  return arrary.contains(number);
}

List<String> seperateString(String? str) {
  // input string and seperate it to , or 、and return string list.
  if (str == null || str.isEmpty) {
    return [];
  }
  return str.split(RegExp(r'[，、,]')); // Split by comma or Chinese punctuation
}
