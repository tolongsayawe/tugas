import 'package:vania/vania.dart';

class PesananController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'List of pesanan'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    // Logika untuk menyimpan data pesanan
    return Response.json({'message': 'Pesanan created'});
  }

  Future<Response> show(int id) async {
    return Response.json({'message': 'Detail of pesanan with id: $id'});
  }

  Future<Response> edit(int id) async {
    return Response.json({'message': 'Edit form for pesanan with id: $id'});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({'message': 'Pesanan with id: $id updated'});
  }

  Future<Response> destroy(int id) async {
    return Response.json({'message': 'Pesanan with id: $id deleted'});
  }
}

final PesananController pesananCtrl = PesananController();