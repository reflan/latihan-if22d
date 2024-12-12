import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DosenController extends GetxController {
  //TODO: Implement DosenController

  late TextEditingController cNidn;
  late TextEditingController cNama;
  late TextEditingController cProdi;
  late TextEditingController cFakultas;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> StreamData() {
    CollectionReference dosen = firestore.collection('dosen');

    return dosen.snapshots();
  }

  void add(String nidn, String nama, String prodi, String fakultas) async {
    CollectionReference dosen = firestore.collection("dosen");

    try {
      await dosen.add({
        "nidn": nidn,
        "nama": nama,
        "prodi": prodi,
        "fakulats": fakultas,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data dosen",
          onConfirm: () {
            cNidn.clear();
            cNama.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Dosen.",
      );
    }
  }

  // Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
  //   DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

  //   return docRef.get();
  // }

  // void Update(String npm, String nama, String alamat, String id) async {
  //   DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

  //   try {
  //     await mahasiswaById.update({
  //       "npm": npm,
  //       "nama": nama,
  //       "alamat": alamat,
  //     });

  //     Get.defaultDialog(
  //       title: "Berhasil",
  //       middleText: "Berhasil mengubah data Mahasiswa.",
  //       onConfirm: () {
  //         cNpm.clear();
  //         cNama.clear();
  //         Get.back();
  //         Get.back();
  //       },
  //       textConfirm: "OK",
  //     );
  //   } catch (e) {
  //     print(e);
  //     Get.defaultDialog(
  //       title: "Terjadi Kesalahan",
  //       middleText: "Gagal Menambahkan Mahasiswa.",
  //     );
  //   }
  // }

  // void delete(String id) {
  //   DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

  //   try {
  //     Get.defaultDialog(
  //       title: "Info",
  //       middleText: "Apakah anda yakin menghapus data ini ?",
  //       onConfirm: () {
  //         docRef.delete();
  //         Get.back();
  //         Get.defaultDialog(
  //           title: "Sukses",
  //           middleText: "Berhasil menghapus data",
  //         );
  //       },
  //       textConfirm: "Ya",
  //       textCancel: "Batal",
  //     );
  //   } catch (e) {
  //     print(e);
  //     Get.defaultDialog(
  //       title: "Terjadi kesalahan",
  //       middleText: "Tidak berhasil menghapus data",
  //     );
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    cNidn = TextEditingController();
    cNama = TextEditingController();
    cProdi = TextEditingController();
    cFakultas = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNidn.dispose();
    cNama.dispose();
    cProdi.dispose();
    cFakultas.dispose();
    super.onClose();
  }
}
