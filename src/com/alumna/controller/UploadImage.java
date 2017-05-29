package com.alumna.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/UploadImage")
public class UploadImage {
	@RequestMapping("/Submit")
	public String Submit(MultipartFile pictureFile)throws Exception{
		//原始文件名称
		String pictureFile_name =  pictureFile.getOriginalFilename();
		//新文件名称
		String newFileName = pictureFile_name.substring(pictureFile_name.lastIndexOf("."));
		
		//上传图片
		File uploadPic = new java.io.File("G:/"+newFileName);
		
		if(!uploadPic.exists()){
			uploadPic.mkdirs();
		}
		//向磁盘写文件
		pictureFile.transferTo(uploadPic);
		return newFileName;
	}
}
