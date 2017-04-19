package com.blog.service.impl.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.entity.Photo;
import com.blog.service.CritiqueService;
import com.blog.service.PhotoService;

public class PhotoServiceImplTest {
	static PhotoService photoService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beans.xml");
			photoService = (PhotoService) applicationContext.getBean("photoServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSave() {
		photoService.save(new Photo("../image_upload/1.jpg","这是第"+1+"张照片", "内容", "1", "相册", "2014-4-25"));
		photoService.save(new Photo("../image_upload/001.jpg","这是第"+1+"张照片", "内容", "2", "相册", "2014-4-25"));
		for (int i = 2; i <= 12; i++) {
			photoService.save(new Photo("../image_upload/"+i+".jpg","这是第"+i+"张照片", "内容", "1", null, "2014-4-25"));
		}
		for (int i = 2; i <= 8; i++) {
			photoService.save(new Photo("../image_upload/00"+i+".jpg","这是第"+i+"张照片", "内容", "2", null, "2014-4-26"));
		}
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testQuery() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPhotos() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPhotosString() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetPhotosByNotice() {
		fail("Not yet implemented");
	}

}
