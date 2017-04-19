package com.blog.service.impl.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;

public class CritiqueServiceImplTest {
	static CritiqueService critiqueService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beans.xml");
			critiqueService = (CritiqueService) applicationContext.getBean("critiqueServiceImpl");
		} catch (RuntimeException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSave() {
		for (int i = 0; i < 6; i++) {
			critiqueService.save(new Critique("这个博客不错不错,我很喜欢","赵浩", "2014-4-24", null, 1, null, null));
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
	public void testGetSize() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetCritiques() {
		fail("Not yet implemented");
	}

}
