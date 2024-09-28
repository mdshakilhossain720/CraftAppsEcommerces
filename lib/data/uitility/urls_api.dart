
class Urls{
 static final String _baseurl="https://ecommerce-api.codesilicon.com/api";

  final String homeSlider="$_baseurl/ListProductSlider";
  final String categoryList="$_baseurl/CategoryList";
  static String listProductByCategory(int categoryId)=>"$_baseurl/ListProductByCategory/$categoryId";

  static String productListByRemark(String remark)=>"$_baseurl/ListProductByRemark/${remark}";


}