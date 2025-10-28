import '../database.dart';

class FootprintWithDateTable extends SupabaseTable<FootprintWithDateRow> {
  @override
  String get tableName => 'footprint_with_date';

  @override
  FootprintWithDateRow createRow(Map<String, dynamic> data) =>
      FootprintWithDateRow(data);
}

class FootprintWithDateRow extends SupabaseDataRow {
  FootprintWithDateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FootprintWithDateTable();

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get targetId => getField<int>('target_id');
  set targetId(int? value) => setField<int>('target_id', value);

  String? get formattedCreatedAt => getField<String>('formatted_created_at');
  set formattedCreatedAt(String? value) =>
      setField<String>('formatted_created_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
