import '../database.dart';

class UserBadgesTable extends SupabaseTable<UserBadgesRow> {
  @override
  String get tableName => 'user_badges';

  @override
  UserBadgesRow createRow(Map<String, dynamic> data) => UserBadgesRow(data);
}

class UserBadgesRow extends SupabaseDataRow {
  UserBadgesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBadgesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int? get badgeId => getField<int>('badge_id');
  set badgeId(int? value) => setField<int>('badge_id', value);
}
