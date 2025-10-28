import '../database.dart';

class BadgesTable extends SupabaseTable<BadgesRow> {
  @override
  String get tableName => 'badges';

  @override
  BadgesRow createRow(Map<String, dynamic> data) => BadgesRow(data);
}

class BadgesRow extends SupabaseDataRow {
  BadgesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BadgesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get iconUrl => getField<String>('icon_url');
  set iconUrl(String? value) => setField<String>('icon_url', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  int get requiredPoints => getField<int>('required_points')!;
  set requiredPoints(int value) => setField<int>('required_points', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
