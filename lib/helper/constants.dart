const String defaultProfileUrl =
    "https://drive.google.com/uc?id=1BPJbrGSoEWRPa1drLVo6Z15qluQ7NT-j";
const String defaultCompoundUrl = "https://assets-us-01.kc-usercontent.com/"
    "4ebdfa77-20fc-0050-ef4c-ef193bceaeb5/"
    "bfef235c-dc56-40d2-b8ec-d55986c8356a/Villas.jpg";
const String defaultCompoundAssetPath =
    "assets/images/palm_hills_logo_picture.png";

const List accountsCreations = [
  {"name": "Owner", "img_path": "assets/icons/owner_key.svg"},
  {"name": "Tenant", "img_path": "assets/icons/tenant_key.svg"},
  {"name": "Family Member", "img_path": "assets/icons/family_members.svg"}
];
// const List creationRoadMapList = [
//   "Add details",
//   "Verfiy Number",
//   "Check Identity"
// ];
const List relationships = ["Spouse", "Child", "Parent", "Sibling"];
const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
String monthNameFromNumber(int month) {
  switch (month) {
    case 1:
      // case "يناير":
      return "January";
    case 2:
      //case "فبراير":
      return "February";
    case 3:
      // case "مارس":
      return "March";
    case 4:
      //  case "ابريل":
      return "April";
    case 5:
      //  case "مايو":
      return "May";
    case 6:
      //  case "يونيو":
      return "June";
    case 7:
      //  case "يوليو":
      return "July";
    case 8:
      //  case "اغسطس":
      return "August";
    case 9:
      //  case "سبتمبر":
      return "September";
    case 10:
      return "October";
    //  case "اكتوبر":
    case 11:
      return "November";
    case 12:
      //  case "نوفمبر":
      return "December";
    default:
      return "";
  }
}

class Constants {
  static const String baseUrl = 'http://d365.blive.me/PHD2/api/data/v9.1/';
  static const headers = {
    "Content-Type": "application/json",
    "Prefer": "return=representation"
  };
  static const String passwordHint =
      '''
Password should be at least 8 characters long.
At least one upper case and lower case letters.
At least one special characters (@#\$%^*!).
At least one number.
''';
}
