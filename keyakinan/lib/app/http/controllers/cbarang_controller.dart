import 'package:vania/vania.dart';

class CbarangController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'List of cbarang'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    // Logika untuk menyimpan data cbarang
    return Response.json({'message': 'Cbarang created'});
  }

  Future<Response> show(String id) async {
    return Response.json({'message': 'Detail of cbarang with id: $id'});
  }

  Future<Response> edit(String id) async {
    return Response.json({'message': 'Edit form for cbarang with id: $id'});
  }

  Future<Response> update(Request request, String id) async {
    return Response.json({'message': 'Cbarang with id: $id updated'});
  }

  Future<Response> destroy(String id) async {
    return Response.json({'message': 'Cbarang with id: $id deleted'});
  }
}

final CbarangController cbarangCtrl = CbarangController();