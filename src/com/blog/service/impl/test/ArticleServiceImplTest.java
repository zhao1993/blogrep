package com.blog.service.impl.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.entity.Article;
import com.blog.service.ArticleService;

public class ArticleServiceImplTest {
	static ArticleService articleService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beans.xml");
			articleService = (ArticleService) applicationContext.getBean("articleServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSave() {
		for (int i = 0; i < 9; i++) {
			articleService.save(new Article("黑色Html5个人博客模板主题《如影随形》","测试内容卡箍卡冷eiagia",null,"2014-04-1"+i,"赵浩", 50+i, "日记", "备注", 55-i, "个人心情"));
		}
	}

	@Test
	public void testDelete() {
		System.out.println(articleService.queryBefore(1));
		System.out.println(articleService.queryAfter(24));
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
	public void testGetSize() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetArticlesIntegerInteger() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetNewArticles() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetHotArticles() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetSizeString() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetArticlesStringIntegerInteger() {
		fail("Not yet implemented");
	}

}
