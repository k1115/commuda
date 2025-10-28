import '../database.dart';

class BlockUsersTable extends SupabaseTable<BlockUsersRow> {
  @override
  String get tableName => 'block_users';

  @override
  BlockUsersRow createRow(Map<String, dynamic> data) => BlockUsersRow(data);
}

class BlockUsersRow extends SupabaseDataRow {
  BlockUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlockUsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  int get blockUserId => getField<int>('block_user_id')!;
  set blockUserId(int value) => setField<int>('block_user_id', value);
}
