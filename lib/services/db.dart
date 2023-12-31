import 'package:flutter/material.dart';
import 'package:keep_notes/model/MyNoteModel.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class NotesDatabse {
  static final NotesDatabse instance = NotesDatabse._init();
  static Database? _database;
  NotesDatabse._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('Notes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE Notes(
      ${NotesImpNames.id} $idType,
      ${NotesImpNames.pin} $boolType,
      ${NotesImpNames.title} $textType,
      ${NotesImpNames.content} $textType,
      ${NotesImpNames.createdTime} $textType
    )''');
  }

  Future<Note?> InsertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final query_result =
        await db!.query(NotesImpNames.TableName, orderBy: orderBy);

    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(
      NotesImpNames.TableName,
      columns: NotesImpNames.values,
      where: '${NotesImpNames.id} = ?',
      whereArgs: [id],
    );
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, note.toJson(),
        where: '${NotesImpNames.id}=?', whereArgs: [note.id]);
  }

  Future delteNote(Note note) async {
    final db = await instance.database;

    await db!.delete(NotesImpNames.TableName,
        where: '${NotesImpNames.id}=?', whereArgs: [note.id]);
  }

  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}
