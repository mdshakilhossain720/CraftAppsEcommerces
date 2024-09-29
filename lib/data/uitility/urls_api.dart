
class Urls{
 static const String _baseurl="https://ecommerce-api.codesilicon.com/api";

  final String homeSlider="$_baseurl/ListProductSlider";
  final String categoryList="$_baseurl/CategoryList";
  static String listProductByCategory(int categoryId)=>"$_baseurl/ListProductByCategory/$categoryId";

  static String productListByRemark(String remark)=>"$_baseurl/ListProductByRemark/${remark}";
 static String productListDetails(int productId)=>"$_baseurl/ProductDetailsById/${productId}";
  static String addToCart="$_baseurl/CreateCartList";
 static String emails(String email)=>"$_baseurl/UserLogin/${email}";

 static String emailsOtp(String email,String otp)=>"$_baseurl/UserLogin/$email $otp";

