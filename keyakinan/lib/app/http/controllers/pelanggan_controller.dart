import 'package:vania/vania.dart';
import 'package:keyakinan/app/models/pelanggan.dart';

class PelangganController extends Controller {
  
  // Mendapatkan semua pelanggan
  Future<Response> index(Request request) async {
    final pelangganList = await Pelanggan.query(); // Mengambil semua pelanggan
    return Response.json({
      'message': 'GET request successful',
      'data': pelangganList,
    });
  }

  // Mendapatkan pelanggan berdasarkan ID
  Future<Response> show(Request request) async {
    final id = request.uri.pathSegments.last; // Mengambil ID dari URL
    final pelangganList = await Pelanggan.query(); // Ambil semua pelanggan
    final pelanggan = pelangganList.firstWhere(
      (p) => p.userId.toString() == id,
      orElse: () => Pelanggan(userUsername: '', userPassword: '', userId: -1), // Kembalikan objek dummy
    );

    if (pelanggan.userId != -1) { // Cek apakah pelanggan ditemukan
      return Response.json(pelanggan);
    }
    return Response.json({'message': 'Pelanggan not found'}, 404);
  }

  // Menambahkan pelanggan baru
  Future<Response> store(Request request) async {
    final data = await request.input(); // Mengambil data dari request
    final pelanggan = Pelanggan(
      userUsername: data['user_username'],
      userPassword: data['user_password'],
      userId: 0, // Atur userId sesuai dengan logika penyimpanan Anda
    );
    await pelanggan.save(); // Menyimpan pelanggan
    return Response.json({'message': 'Pelanggan created', 'id': pelanggan.userId}, 201);
  }

  // Memperbarui pelanggan berdasarkan ID
  Future<Response> update(Request request) async {
    final id = request.uri.pathSegments.last; // Mengambil ID dari URL
    final data = await request.input(); // Mengambil data dari request
    final pelangganList = await Pelanggan.query(); // Ambil semua pelanggan
    final pelanggan = pelangganList.firstWhere(
      (p) => p.userId.toString() == id,
      orElse: () => Pelanggan(userUsername: '', userPassword: '', userId: -1), // Kembalikan objek dummy
    );

    if (pelanggan.userId != -1) { // Cek apakah pelanggan ditemukan
      pelanggan.userUsername = data['user_username'];
      pelanggan.userPassword = data['user_password'];
      await pelanggan.save(); // Menyimpan perubahan
      return Response.json({'message': 'Pelanggan updated', 'id': pelanggan.userId});
    }
    return Response.json({'message': 'Pelanggan not found'}, 404);
  }

  // Menghapus pelanggan berdasarkan ID
  Future<Response> destroy(Request request) async {
    final id = request.uri.pathSegments.last; // Mengambil ID dari URL
    final pelangganList = await Pelanggan.query(); // Ambil semua pelanggan
    final pelanggan = pelangganList.firstWhere(
      (p) => p.userId.toString() == id,
      orElse: () => Pelanggan(userUsername: '', userPassword: '', userId: -1), // Kembalikan objek dummy
    );

    if (pelanggan.userId != -1) { // Cek apakah pelanggan ditemukan
      await pelanggan.delete(); // Menghapus pelanggan
      return Response.json({'message': 'Pelanggan deleted', 'id': pelanggan.userId});
    }
    return Response.json({'message': 'Pelanggan not found'}, 404);
  }
}