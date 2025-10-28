import '../database.dart';

class BadgeConditionsTable extends SupabaseTable<BadgeConditionsRow> {
  @override
  String get tableName => 'badge_conditions';

  @override
  BadgeConditionsRow createRow(Map<String, dynamic> data) =>
      BadgeConditionsRow(data);
}

class BadgeConditionsRow extends SupabaseDataRow {
  BadgeConditionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BadgeConditionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get badgeId => getField<int>('badge_id')!;
  set badgeId(int value) => setField<int>('badge_id', value);

  String get condition => getField<String>('condition')!;
  set condition(String value) => setField<String>('condition', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
