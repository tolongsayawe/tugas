import 'package:vania/vania.dart';

class BarangController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'List of barang'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    // Logika untuk menyimpan data barang
    return Response.json({'message': 'Barang created'});
  }

  Future<Response> show(int id) async {
    // Logika untuk menampilkan detail barang berdasarkan id
    return Response.json({'message': 'Detail of barang with id: $id'});
  }

  Future<Response> edit(int id) async {
    // Logika untuk menampilkan form edit barang berdasarkan id
    return Response.json({'message': 'Edit form for barang with id: $id'});
  }

  Future<Response> update(Request request, int id) async {
    // Logika untuk memperbarui data barang berdasarkan id
    return Response.json({'message': 'Barang with id: $id updated'});
  }

  Future<Response> destroy(int id) async {
    // Logika untuk menghapus barang berdasarkan id
    return Response.json({'message': 'Barang with id: $id deleted'});
  }
}

final BarangController barangCtrl = BarangController();