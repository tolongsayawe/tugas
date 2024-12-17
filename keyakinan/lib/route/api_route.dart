import 'package:vania/vania.dart';
import 'package:keyakinan/app/http/controllers/auth_controller.dart';
import 'package:keyakinan/app/http/controllers/pelanggan_controller.dart'; // Mengimpor controller Pelanggan
import 'package:keyakinan/app/http/middleware/authenticate.dart';
import 'package:keyakinan/app/http/middleware/home_middleware.dart';
import 'package:keyakinan/app/http/middleware/error_response_middleware.dart';

class ApiRoute implements Route {
  final PelangganController pelangganController = PelangganController(); // Membuat instance

  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    // Rute untuk Hello World
    Router.get("/hello-world", () {
      return Response.html('Hello World');
    }).middleware([HomeMiddleware()]);

    // Rute untuk menangani permintaan yang salah
    Router.get('/wrong-request', () {
      return Response.json({'message': 'Hi wrong request'});
    }).middleware([ErrorResponseMiddleware()]);

    // Rute untuk login menggunakan pelanggan
    Router.post('/login', authCtrl.login); // Pastikan authCtrl.login menggunakan pelanggan

    // Rute untuk logout
    Router.post('/logout', authCtrl.logout);

    // Rute untuk Pelanggan
    Router.get('/pelanggan', (Request request) {
      return pelangganController.index(request); // Mendapatkan semua pelanggan
    }).middleware([HomeMiddleware()]);

    Router.get('/pelanggan/<id>', (Request request) {
      return pelangganController.show(request); // Mendapatkan pelanggan berdasarkan ID
    }).middleware([HomeMiddleware()]);

    Router.post('/pelanggan', (Request request) {
      return pelangganController.store(request); // Menambahkan pelanggan baru
    }).middleware([HomeMiddleware()]);

    Router.put('/pelanggan/<id>', (Request request) {
      return pelangganController.update(request); // Memperbarui pelanggan berdasarkan ID
    }).middleware([HomeMiddleware()]);

    Router.delete('/pelanggan/<id>', (Request request) {
      return pelangganController.destroy(request); // Menghapus pelanggan berdasarkan ID
    }).middleware([HomeMiddleware()]);
  }
}