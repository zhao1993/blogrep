package com.blog.action.upload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;

import com.blog.BaseAction;
import com.blog.util.IOUtils;

@Controller
public class ImageUpload extends BaseAction{
	private File some;
	private String someFileName;
	private String someContentType;
	
	private String imagePath;
	
	public String execute() throws Exception{
		if(some.getTotalSpace()==0||some==null){
			return "success";
		}
		String imageName = "file_"+System.currentTimeMillis()+someFileName.substring(someFileName.lastIndexOf("."));
		imagePath = "image_upload/"+imageName;
		String realImagePath = servletContext.getRealPath(imagePath);
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(some));
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(realImagePath));
		IOUtils.cp(bis, bos);
		some = null;
		bis.close();
		bos.close();
		return "success";
	}

	public File getSome() {
		return some;
	}

	public void setSome(File some) {
		this.some = some;
	}

	public String getSomeFileName() {
		return someFileName;
	}

	public void setSomeFileName(String someFileName) {
		this.someFileName = someFileName;
	}

	public String getSomeContentType() {
		return someContentType;
	}

	public void setSomeContentType(String someContentType) {
		this.someContentType = someContentType;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
}
