
class UserModele {

  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const UserModele({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
});

   toJson(){
     return {
       "user_name":fullName,
       "user_phone" :phoneNo ,
       "user_password": password,
       "user_mail": email
     };
   }

}