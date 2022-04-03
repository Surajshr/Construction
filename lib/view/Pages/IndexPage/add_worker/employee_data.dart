class Info {
  String ID;
  String firstName;
  String LastName;
  String Street;
  String Address;
  String City;
  String State;
  String Email;
  String PositionTitle;
  String E_Name;
  String E_number;
  String Contact;

  Info(
      {this.ID,
      this.firstName,
      this.LastName,
      this.Street,
      this.Address,
      this.City,
      this.State,
      this.Email,
      this.PositionTitle,
      this.E_Name,
      this.E_number,
      this.Contact});

  factory Info.fromJson(Map<String, dynamic> json){
    return Info(
      ID: json['id'] as String,
      firstName: json['FirstName'] as String,
      LastName: json['LastName'] as String,
      Street: json['Street'] as String,
      Address: json['address'] as String,
      City: json['City'] as String,
      State: json['State'] as String,
      Email: json['Email'] as String,
      PositionTitle: json['PositionTitle'] as String,
      E_Name: json['EmergencyContactName'] as String,
      E_number: json['EmergencyContactNumber'] as String,
      Contact: json['phoneNumber'] as String,
    );
  }
}
