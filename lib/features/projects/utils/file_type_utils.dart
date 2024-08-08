class FileTypeUtils{
  static bool isImageFile(String url){
    String x = url
        .substring(url.lastIndexOf('.') + 1);
    return (x== "png"||x=="jpg"||x=="jpeg"||x == "svg"||x == "pjp"||x == "pjpeg"||x == "jfif"||x == "webp");
  }

  static String fileType(String url){
    String imageSuffix = url
        .substring(url.lastIndexOf('.') + 1);
    if(imageSuffix=="xlsx"){
      return "assets/images/excel_file_image.png";
    }
    else if (imageSuffix == "txt")
    {
      return "assets/images/txt_file_image.jpeg";
    }
    else if (imageSuffix == "pdf")
    {
      return "assets/images/pdf_files_image.jpg";
    }
    else if (imageSuffix == "zip")
    {
      return "assets/images/zip_file_image.jpg";
    }
    else if(imageSuffix == "docx")
    {
      return "assets/images/word_files_image.jpeg";
    }
    else
    {
      return "assets/images/file_image.jpg";
    }
  }
}