class Constants {
  static const String defaultProfileUrl =
      "https://drive.google.com/uc?id=1BPJbrGSoEWRPa1drLVo6Z15qluQ7NT-j";
  static const String defaultCompoundUrl =
      "https://assets-us-01.kc-usercontent.com/"
      "4ebdfa77-20fc-0050-ef4c-ef193bceaeb5/"
      "bfef235c-dc56-40d2-b8ec-d55986c8356a/Villas.jpg";
  static const String defaultCompoundAssetPath =
      "assets/images/palm_hills_logo_picture.png";

  static const List accountsCreations = [
    {"name": "Owner", "img_path": "assets/icons/owner_key.svg"},
    {"name": "Tenant", "img_path": "assets/icons/tenant_key.svg"},
    {"name": "Family Member", "img_path": "assets/icons/family_members.svg"}
  ];

  static const String baseUrl = 'http://private data';
  static const headers = {
    "Content-Type": "application/json",
    "Prefer": "return=representation"
  };
  static const String passwordHint = '''
Password should be at least 8 characters long.
At least one upper case and lower case letters.
At least one special characters (@#\$%^*!).
At least one number.
''';
}
