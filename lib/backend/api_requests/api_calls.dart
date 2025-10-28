import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SupabaseDB Group Code

class SupabaseDBGroup {
  static String getBaseUrl() =>
      'https://vtrsvfqllcqjlenmcfdf.supabase.co/rest/v1/rpc/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
  };
  static GetUserInfoByAuthIdCall getUserInfoByAuthIdCall =
      GetUserInfoByAuthIdCall();
  static GetCommunityInfoCall getCommunityInfoCall = GetCommunityInfoCall();
}

class GetUserInfoByAuthIdCall {
  Future<ApiCallResponse> call({
    String? pAuthUserId = '',
  }) async {
    final baseUrl = SupabaseDBGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_auth_user_id": "${escapeStringForJson(pAuthUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserInfoByAuthId',
      apiUrl: '${baseUrl}get_user_full_by_auth_user_id',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCommunityInfoCall {
  Future<ApiCallResponse> call({
    int? pUserId = 19,
  }) async {
    final baseUrl = SupabaseDBGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "p_user_id": ${pUserId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetCommunityInfo',
      apiUrl: '${baseUrl}get_friends_communities_and_my_communities',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? communities(dynamic response) => getJsonField(
        response,
        r'''$.communities''',
        true,
      ) as List?;
}

/// End SupabaseDB Group Code

class SendEmailCall {
  static Future<ApiCallResponse> call({
    String? email = 'codegenius10@outlook.com',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmail',
      apiUrl:
          'https://vtrsvfqllcqjlenmcfdf.supabase.co/functions/v1/send-email',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetunreadcountsCall {
  static Future<ApiCallResponse> call({
    int? memberId = 6,
  }) async {
    final ffApiRequestBody = '''
{
  "member_id": ${memberId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getunreadcounts',
      apiUrl:
          'https://vtrsvfqllcqjlenmcfdf.supabase.co/rest/v1/rpc/get_unread_counts',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserEmailCall {
  static Future<ApiCallResponse> call({
    String? authUserId = '',
    String? email = '',
  }) async {
    final ffApiRequestBody = '''
{
  "auth_user_id": "${escapeStringForJson(authUserId)}",
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserEmail',
      apiUrl:
          'https://vtrsvfqllcqjlenmcfdf.supabase.co/functions/v1/update-user-email',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? authUserId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "auth_user_id": "${escapeStringForJson(authUserId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl:
          'https://vtrsvfqllcqjlenmcfdf.supabase.co/functions/v1/delete-auth-user',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZ0cnN2ZnFsbGNxamxlbm1jZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTEyNTU0OTMsImV4cCI6MjA2NjgzMTQ5M30.R95spOTnYPtyOrjG3xE6PT3Mg_opbt4XAJvgnVKcKQs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
