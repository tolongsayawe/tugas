import 'dart:io';
import 'package:vania/vania.dart';
import 'create_pelanggan_table.dart';
import 'create_pesanan_table.dart';
import 'create_pbarang_table.dart';
import 'create_cbarang_table.dart';
import 'create_barang_table.dart';
import 'create_vendors_table.dart';


void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreatePelangganTable().up();
		 await CreateVendorsTable().up();
		 await CreateBarangTable().up();
		 await CreateCbarangTable().up();
		 await CreatePesananTable().up();
		 await CreatePbarangTable().up();
	}

  dropTables() async {
		 await CreateVendorsTable().down();
		 await CreateBarangTable().down();
		 await CreateCbarangTable().down();
		 await CreatePbarangTable().down();
		 await CreatePesananTable().down();
		 await CreatePelangganTable().down();
	 }
}
