import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Pelanggan {
  String userUsername;
  String userPassword;
  int userId;

  Pelanggan({
    required this.userUsername,
    required this.userPassword,
    required this.userId,
  });

  // Fungsi untuk membuka database yang sudah ada
  static Future<Database> _openDatabase() async {
    String path = join(await getDatabasesPath(), 'pelanggan.db'); // Ganti dengan nama database Anda
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Membuat tabel pelanggan jika belum ada
        await db.execute('''
          CREATE TABLE IF NOT EXISTS pelanggan (
            user_id INTEGER PRIMARY KEY AUTOINCREMENT,
            user_username TEXT NOT NULL,
            password TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> save() async {
    final db = await _openDatabase();
    if (userId == 0) {
      userId = await db.insert(
        'pelanggan',
        {
          'user_username': userUsername,
          'password': userPassword,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      await db.update(
        'pelanggan',
        {
          'user_username': userUsername,
          'password': userPassword,
        },
        where: 'user_id = ?',
        whereArgs: [userId],
      );
    }
  }

  Future<void> delete() async {
    final db = await _openDatabase();
    await db.delete(
      'pelanggan',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }

  static Future<List<Pelanggan>> query() async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query('pelanggan');

    return List.generate(maps.length, (i) {
      return Pelanggan(
        userId: maps[i]['user_id'],
        userUsername: maps[i]['user_username'],
        userPassword: maps[i]['password'],
      );
    });
  }

  static Future<Pelanggan?> findById(int id) async {
    final db = await _openDatabase();
    final List<Map<String, dynamic>> maps = await db.query(
      'pelanggan',
      where: 'user_id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Pelanggan(
        userId: maps[0]['user_id'],
        userUsername: maps[0]['user_username'],
        userPassword: maps[0]['password'],
      );
    }
    return null; // Kembalikan null jika tidak ditemukan
  }

  // Menambahkan metode findByUsername
  static Future<Pelanggan?> findByUsername(String username) async {
    final db = await _openDatabase(); // Ambil instance database
    final List<Map<String, dynamic>> maps = await db.query(
      'pelanggan',
      where: 'user_username = ?',
      whereArgs: [username],
    );

    if (maps.isNotEmpty) {
      return Pelanggan(
        userId: maps[0]['user_id'],
        userUsername: maps[0]['user_username'],
        userPassword: maps[0]['password'],
      );
    }
    return null; // Kembalikan null jika tidak ditemukan
  }
}