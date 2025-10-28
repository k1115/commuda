import '../database.dart';

class FriendsTable extends SupabaseTable<FriendsRow> {
  @override
  String get tableName => 'friends';

  @override
  FriendsRow createRow(Map<String, dynamic> data) => FriendsRow(data);
}

class FriendsRow extends SupabaseDataRow {
  FriendsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FriendsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get userId => getField<int>('user_id');
  set userId(int? value) => setField<int>('user_id', value);

  int? get friendId => getField<int>('friend_id');
  set friendId(int? value) => setField<int>('friend_id', value);
}
