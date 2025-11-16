import 'package:app_emergencia/src/domain/models/user.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:app_emergencia/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:app_emergencia/src/presentation/pages/widgets/DefaultIconBack.dart';
import 'package:app_emergencia/src/presentation/pages/widgets/DefaultTextField.dart';
import 'package:app_emergencia/src/presentation/utils/BlocFormItem.dart';
import 'package:app_emergencia/src/presentation/utils/GalleryOrPhotoDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateContent extends StatelessWidget {
  final User? user;
  final ProfileUpdateState? state;

  const ProfileUpdateContent(this.user, this.state);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formKey,
      child: Stack(
        children: [
          //primera parte del stack
          Column(
            children: [
              _HeaderProfile(context),
              Spacer(),
              _actionProfile(context, "Actualizar usuario", Icons.update),
              SizedBox(height: 50),
            ],
          ),
          // Ahora esta llamada usa el MÉTODO _cardUser de esta clase
          _cardUser(context),
          DefaultIconBack(margin: EdgeInsets.only(top: 60, left: 30)),
        ],
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GalleryOrPhotoDialog(
          context,
          () => {context.read<ProfileUpdateBloc>().add(PickImage())},
          () => {context.read<ProfileUpdateBloc>().add(TakePhoto())},
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: 150,
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipOval(
            child: state?.img != null
                ? Image.file(state!.img!, fit: BoxFit.cover)
                : FadeInImage.assetNetwork(
                    placeholder: "assets/img/user_image.png",
                    image:
                        "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
          ),
        ),
      ),
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _cardUser(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 120, bottom: 20, left: 20, right: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.50,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            _imageUser(context),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: DefaultTextfield(
                backgroudColor: Colors.grey,
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                text: 'Nombre',
                icon: Icons.person,
                initValue: user?.name,
                onChange: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    NameChanged(name: Blocformitem(value: text)),
                  );
                },
                validator: (value) {
                  return state?.name?.error;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: DefaultTextfield(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                text: 'Apellido',
                backgroudColor: Colors.grey,
                icon: Icons.person_outline,
                initValue: user?.lastname,
                onChange: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    LastNameChanged(lastname: Blocformitem(value: text)),
                  );
                },
                validator: (value) {
                  return state?.lastname?.error;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: DefaultTextfield(
                margin: EdgeInsets.only(left: 50, right: 50, top: 10),
                text: 'Telefono',
                icon: Icons.phone,
                backgroudColor: Colors.grey,
                initValue: user?.phone,
                onChange: (text) {
                  context.read<ProfileUpdateBloc>().add(
                    Phonechanged(phone: Blocformitem(value: text)),
                  );
                },
                validator: (value) {
                  return state?.phone?.error;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (state!.formKey!.currentContext != null) {
          if (state!.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSubmit());
            Navigator.pop(context);
          }
        } else {
          context.read<ProfileUpdateBloc>().add(FormSubmit());
          Navigator.pop(context);
        }
      },
      child: ListTile(
        title: Text(
          option,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }

  // MÉTODO MOVIDO DENTRO DE LA CLASE
  Widget _HeaderProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 12, 38, 145),
            Color.fromARGB(255, 34, 156, 249),
          ],
        ),
      ),
      child: Text(
        "PERFIL DEL USUARIO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
