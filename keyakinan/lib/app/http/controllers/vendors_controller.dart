import 'package:vania/vania.dart';

class VendorsController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'List of vendors'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    // Logika untuk menyimpan data vendor
    return Response.json({'message': 'Vendor created'});
  }

  Future<Response> show(String id) async {
    return Response.json({'message': 'Detail of vendor with id: $id'});
  }

  Future<Response> edit(String id) async {
    return Response.json({'message': 'Edit form for vendor with id: $id'});
  }

  Future<Response> update(Request request, String id) async {
    return Response.json({'message': 'Vendor with id: $id updated'});
  }

  Future<Response> destroy(String id) async {
    return Response.json({'message': 'Vendor with id: $id deleted'});
  }
}

final VendorsController vendorsCtrl = VendorsController();