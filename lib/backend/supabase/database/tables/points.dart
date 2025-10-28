import '../database.dart';

class PointsTable extends SupabaseTable<PointsRow> {
  @override
  String get tableName => 'points';

  @override
  PointsRow createRow(Map<String, dynamic> data) => PointsRow(data);
}

class PointsRow extends SupabaseDataRow {
  PointsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PointsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get point => getField<int>('point');
  set point(int? value) => setField<int>('point', value);

  int? get itemId => getField<int>('item_id');
  set itemId(int? value) => setField<int>('item_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);
}
