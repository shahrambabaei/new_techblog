class ApiConstant {
  static const baseUrl = "https://techblog.sasansafari.com/Techblog/api/";
  static const baseImgUrl = "https://techblog.sasansafari.com";
  static const getHomeItem = "${baseUrl}home/?command=index";
  static const getArticleItem =
      "${baseUrl}article/get.php?command=new&user_id=1";
  static const getSingleArticleItem =
      "${baseUrl}article/get.php?command=info&id=1&user_id=1";
  static const postRegister=
      "${baseUrl}register/action.php";
}
