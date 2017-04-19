package com.blog.action.login;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;

import com.blog.BaseAction;
import com.blog.util.ImageUtil;


/**
 * action生成验证码
 * @author hao
 *
 */
@Controller
public class ImageCodeAction extends BaseAction{
	
	private InputStream imageStream;
	
	/**
	 * 
	 * @return 图片的输出流
	 */
	public String execute() {
		Map<String,BufferedImage> map = ImageUtil.createImage();
		
		String code = null;
		Set<String> set = map.keySet();
		Iterator<String> it = set.iterator();
		while(it.hasNext()) {
			code = it.next();
		}
		
		session.put("imageCode", code);
		
		BufferedImage image = map.get(code);
		try {
			imageStream = ImageUtil.getInputStream(image);
		} catch (IOException e) {
			e.printStackTrace();
			return "error";
		}
		
		return "success";
	}

	public InputStream getImageStream() {
		return imageStream;
	}

	public void setImageStream(InputStream imageStream) {
		this.imageStream = imageStream;
	}

}
