
class Urls{
 static final String _baseurl="https://ecommerce-api.codesilicon.com/api";

  final String homeSlider="$_baseurl/ListProductSlider";
  final String categoryList="$_baseurl/CategoryList";
   String listProductByCategory(int categoryId)=>"$_baseurl/ListProductByCategory/$categoryId";


}