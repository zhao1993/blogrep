import com.blog.entity.Base;
import com.blog.service.impl.BaseServiceImpl;

public class Test {
	public static void main(String[] args) {
		BaseServiceImpl b = new BaseServiceImpl();
		Base ba = new Base();
		ba.setId(1);
		ba.setTitle("ssssssssssssssssss");
		b.update(ba);
	}
}
