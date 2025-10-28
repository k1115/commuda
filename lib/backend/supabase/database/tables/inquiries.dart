import '../database.dart';

class InquiriesTable extends SupabaseTable<InquiriesRow> {
  @override
  String get tableName => 'inquiries';

  @override
  InquiriesRow createRow(Map<String, dynamic> data) => InquiriesRow(data);
}

class InquiriesRow extends SupabaseDataRow {
  InquiriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InquiriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  String get mailAddress => getField<String>('mail_address')!;
  set mailAddress(String value) => setField<String>('mail_address', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  String? get attachmentUrl => getField<String>('attachment_url');
  set attachmentUrl(String? value) => setField<String>('attachment_url', value);

  String? get reply => getField<String>('reply');
  set reply(String? value) => setField<String>('reply', value);

  DateTime? get replyAt => getField<DateTime>('reply_at');
  set replyAt(DateTime? value) => setField<DateTime>('reply_at', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  int? get category => getField<int>('category');
  set category(int? value) => setField<int>('category', value);
}
