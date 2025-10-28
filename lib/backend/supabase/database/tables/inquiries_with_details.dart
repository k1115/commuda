import '../database.dart';

class InquiriesWithDetailsTable extends SupabaseTable<InquiriesWithDetailsRow> {
  @override
  String get tableName => 'inquiries_with_details';

  @override
  InquiriesWithDetailsRow createRow(Map<String, dynamic> data) =>
      InquiriesWithDetailsRow(data);
}

class InquiriesWithDetailsRow extends SupabaseDataRow {
  InquiriesWithDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InquiriesWithDetailsTable();

  int? get inquiryId => getField<int>('inquiry_id');
  set inquiryId(int? value) => setField<int>('inquiry_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get nickName => getField<String>('nick_name');
  set nickName(String? value) => setField<String>('nick_name', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get mailAddress => getField<String>('mail_address');
  set mailAddress(String? value) => setField<String>('mail_address', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);
}
