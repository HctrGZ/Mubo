import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('mubo.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL UNIQUE,
        email TEXT NOT NULL UNIQUE,
        password_hash TEXT NOT NULL,
        foto_perfil TEXT,
        telefono TEXT,
        fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    ''');

    await db.execute('''
      CREATE TABLE favoritos (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        movieglu_film_id TEXT,
        fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE preferencias_usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        genero_movieglu TEXT,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE recomendaciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        movieglu_film_id TEXT,
        fecha_recomendada DATETIME,
        razon TEXT,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE historial_busqueda (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        query TEXT,
        fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE noticias (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        contenido TEXT,
        imagen TEXT,
        fecha_publicacion DATETIME DEFAULT CURRENT_TIMESTAMP
      );
    ''');
  }


  // FUNCIONES

  // --- Usuarios ---
  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('usuarios', user);
  }

  Future<Map<String, dynamic>?> getUser(String username, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'usuarios',
      where: 'username = ? AND password_hash = ?',
      whereArgs: [username, password],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // --- Favoritos ---
  Future<int> insertFavorito(Map<String, dynamic> favorito) async {
    final db = await instance.database;
    return await db.insert('favoritos', favorito);
  }

  Future<List<Map<String, dynamic>>> getFavoritos(int usuarioId) async {
    final db = await instance.database;
    return await db.query('favoritos', where: 'usuario_id = ?', whereArgs: [usuarioId]);
  }

  // --- Preferencias ---
  Future<int> insertPreferencia(Map<String, dynamic> preferencia) async {
    final db = await instance.database;
    return await db.insert('preferencias_usuario', preferencia);
  }

  Future<List<Map<String, dynamic>>> getPreferencias(int usuarioId) async {
    final db = await instance.database;
    return await db.query('preferencias_usuario', where: 'usuario_id = ?', whereArgs: [usuarioId]);
  }

  // --- Recomendaciones ---
  Future<int> insertRecomendacion(Map<String, dynamic> recomendacion) async {
    final db = await instance.database;
    return await db.insert('recomendaciones', recomendacion);
  }

  Future<List<Map<String, dynamic>>> getRecomendaciones(int usuarioId) async {
    final db = await instance.database;
    return await db.query('recomendaciones', where: 'usuario_id = ?', whereArgs: [usuarioId]);
  }

  // --- Historial de búsqueda ---
  Future<int> insertBusqueda(Map<String, dynamic> busqueda) async {
    final db = await instance.database;
    return await db.insert('historial_busqueda', busqueda);
  }

  Future<List<Map<String, dynamic>>> getHistorialBusqueda(int usuarioId) async {
    final db = await instance.database;
    return await db.query('historial_busqueda', where: 'usuario_id = ?', whereArgs: [usuarioId]);
  }

  // --- Noticias ---
  Future<int> insertNoticia(Map<String, dynamic> noticia) async {
    final db = await instance.database;
    return await db.insert('noticias', noticia);
  }

  Future<List<Map<String, dynamic>>> getNoticias() async {
    final db = await instance.database;
    return await db.query('noticias', orderBy: 'fecha_publicacion DESC');
  }
}
