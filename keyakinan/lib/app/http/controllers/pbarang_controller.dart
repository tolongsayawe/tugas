import 'package:vania/vania.dart';

class PbarangController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'List of pbarang'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    // Logika untuk menyimpan data pbarang
    return Response.json({'message': 'Pbarang created'});
  }

  Future<Response> show(String id) async {
    return Response.json({'message': 'Detail of pbarang with id: $id'});
  }

  Future<Response> edit(String id) async {
    return Response.json({'message': 'Edit form for pbarang with id: $id'});
  }

  Future<Response> update(Request request, String id) async {
    return Response.json({'message': 'Pbarang with id: $id updated'});
  }

  Future<Response> destroy(String id) async {
    return Response.json({'message': 'Pbarang with id: $id deleted'});
  }
}

final PbarangController pbarangCtrl = PbarangController();