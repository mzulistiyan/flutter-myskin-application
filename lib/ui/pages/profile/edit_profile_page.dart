import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/update_pasien_bloc.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_pasien.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_update_pasien.dart';
import 'package:flutter_application_myskin/ui/widget/bottom_navigation.dart';
import 'package:flutter_application_myskin/ui/widget/custom_pop_loading.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class UbahProfilePage extends StatefulWidget {
  final ResponseGetPasien pasien;
  const UbahProfilePage({super.key, required this.pasien});

  @override
  State<UbahProfilePage> createState() => _UbahProfilePageState();
}

class _UbahProfilePageState extends State<UbahProfilePage> {
  final UpdatePasienBloc _updatePasienBloc = UpdatePasienBloc();

  final namePasienController = TextEditingController(text: '');
  final jenkelPasienController = TextEditingController(text: '');
  final tanggalLahirPasienController = TextEditingController(text: '');
  final alamatPasienController = TextEditingController(text: '');
  int? _valueKelamin = 0;

  @override
  void initState() {
    tanggalLahirPasienController.text = widget.pasien.data!.tanggalLahir!;

    if (widget.pasien.data!.jenisKelamin == 'Laki-Laki') {
      _valueKelamin = 1;
      jenkelPasienController.text = 'Laki-Laki';
    } else {
      _valueKelamin = 2;
      jenkelPasienController.text = 'Perempuan';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Ubah Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: const [],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
        children: [
          Image.asset(
            'assets/icons/icon_profile_default.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Nama Pasien',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: TextFormField(
              controller: namePasienController
                ..text = widget.pasien.data!.namaPasien!,
              decoration: const InputDecoration(),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'Jenis Kelamin',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: const Color(0xffEE7814),
                    value: 1,
                    groupValue: _valueKelamin,
                    onChanged: (value) {
                      setState(() {
                        _valueKelamin = value as int?;
                        jenkelPasienController.text = 'Laki-Laki';
                      });
                    },
                  ),
                  Text(
                    'Pria',
                    style: GoogleFonts.poppins(
                      color: (_valueKelamin == 1)
                          ? const Color(0xffEE7814)
                          : Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Row(
                children: [
                  Radio(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: const Color(0xffEE7814),
                    value: 2,
                    groupValue: _valueKelamin,
                    onChanged: (value) {
                      setState(() {
                        _valueKelamin = value as int?;
                        jenkelPasienController.text = 'Perempuan';
                      });
                    },
                  ),
                  Text(
                    'Perempuan',
                    style: GoogleFonts.poppins(
                      color: (_valueKelamin == 2)
                          ? const Color(0xffEE7814)
                          : Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Tanggal Lahir',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tanggalLahirPasienController.text,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () => _modalDatePicker(context),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Alamat',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xffB8B8B8),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: TextFormField(
              controller: alamatPasienController
                ..text = widget.pasien.data!.alamat!,
              decoration: const InputDecoration(),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 32,
        ),
        height: 100,
        child: BlocConsumer<UpdatePasienBloc, UpdatePasienState>(
          bloc: _updatePasienBloc,
          listener: (context, state) {
            print('state is from UpdatePRofileBloc: $state');
            if (state is UpdatePasienLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const PopLoading();
                },
              );
            } else if (state is UpdatePasienSuccess) {
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              });
              Navigator.pop(context);
              Fluttertoast.showToast(
                msg: 'Data berhasil terupdate',
                backgroundColor: const Color(0xffEE7814),
                textColor: Colors.white,
                gravity: ToastGravity.CENTER,
              );
            }

            if (state is UpdatePasienError) {
              Fluttertoast.showToast(
                  msg: responseUpdatePasienToJson(state.responseUpdatePasien));
            }
          },
          builder: (context, state) {
            return PrimaryButton(
              text: 'Ubah Data Profile',
              onPressed: () {
                _updatePasienBloc.add(UpdatePasienPost(
                  namaPasien: namePasienController.text,
                  jenisKelamin: jenkelPasienController.text,
                  alamat: alamatPasienController.text,
                  tanggalLahir: tanggalLahirPasienController.text,
                ));
              },
            );
          },
        ),
      ),
    );
  }

  void _modalDatePicker(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      context: context,
      builder: (builder) {
        DateTime now = DateTime.now();
        DateTime maxdate = DateTime(now.year - 15, now.month, now.day - 5);

        return Wrap(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        'Pilih Tanggal',
                        style: GoogleFonts.poppins(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.close)))
                  ],
                )),
            SizedBox(
              height: 200,
              child: DefaultTextStyle.merge(
                style: GoogleFonts.poppins(),
                child: CupertinoDatePicker(
                    maximumDate: maxdate,
                    initialDateTime: maxdate,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (val) {
                      setState(() {
                        tanggalLahirPasienController.text =
                            DateFormat("y-MM-d").format(val);
                      });
                    }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
              child: PrimaryButton(
                text: 'Pilih Tanggal',
                onPressed: () {
                  if (tanggalLahirPasienController.text == '') {
                    setState(() {
                      tanggalLahirPasienController.text =
                          DateFormat("y-MM-d").format(DateTime.now());
                    });
                  }

                  Navigator.pop(context);
                },
              ),
            )
          ],
        );
      },
    );
  }
}
