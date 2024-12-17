// auth_controller.dart
import 'package:vania/vania.dart';
import 'package:keyakinan/app/models/pelanggan.dart'; // Pastikan Anda mengimpor model Pelanggan

class AuthController extends Controller {
  Future<Response> login(Request request) async {
    final username = request.input('user_username');
    final password = request.input('user_password');

    // Cek apakah pengguna ada di database
    final pelanggan = await Pelanggan.findByUsername(username);

    if (pelanggan != null && pelanggan.userPassword == password) {
      // Jika password cocok, buat token atau session
      return Response.json({'message': 'Login successful', 'user_id': pelanggan.userId});
    } else {
      // Mengembalikan respons dengan status 401
      return Response.json({'message': 'Invalid username or password'}, 401);
    }
  }

  Future<Response> logout(Request request) async {
    // Logika untuk logout (misalnya, menghapus session atau token)
    return Response.json({'message': 'Logout successful'});
  }
}

final AuthController authCtrl = AuthController();