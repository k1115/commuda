import '../database.dart';

class FootprintTable extends SupabaseTable<FootprintRow> {
  @override
  String get tableName => 'footprint';

  @override
  FootprintRow createRow(Map<String, dynamic> data) => FootprintRow(data);
}

class FootprintRow extends SupabaseDataRow {
  FootprintRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FootprintTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get targetId => getField<int>('target_id')!;
  set targetId(int value) => setField<int>('target_id', value);

  int get communityId => getField<int>('community_id')!;
  set communityId(int value) => setField<int>('community_id', value);
}
