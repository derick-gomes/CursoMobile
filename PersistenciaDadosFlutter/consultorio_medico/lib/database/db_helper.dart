import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/paciente.dart';
import '../models/consulta.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'pacientes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE pacientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        cpf TEXT,
        dataNascimento TEXT,
        telefone TEXT,
        email TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE consultas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pacienteId INTEGER,
        data TEXT,
        hora TEXT,
        especialidade TEXT,
        observacoes TEXT,
        status TEXT,
        FOREIGN KEY (pacienteId) REFERENCES pacientes(id)
      )
    ''');
  }

  Future<int> insertPaciente(Paciente paciente) async {
    final db = await database;
    return await db.insert('pacientes', paciente.toMap());
  }

  Future<List<Paciente>> getPacientes() async {
    final db = await database;
    final result = await db.query('pacientes');
    return result.map((e) => Paciente.fromMap(e)).toList();
  }

  Future<int> insertConsulta(Consulta consulta) async {
    final db = await database;
    return await db.insert('consultas', consulta.toMap());
  }

  Future<List<Consulta>> getConsultasPorPaciente(int pacienteId) async {
    final db = await database;
    final result = await db.query(
      'consultas',
      where: 'pacienteId = ?',
      whereArgs: [pacienteId],
    );
    return result.map((e) => Consulta.fromMap(e)).toList();
  }
}
