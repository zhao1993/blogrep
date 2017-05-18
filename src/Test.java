import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Formatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;

import com.blog.entity.Base;
import com.blog.service.impl.BaseServiceImpl;

public class Test {

    public static String transBytesToStr(byte[] bytes){  
        StringBuffer buffer = new StringBuffer();  
        for(int i = 0; i < bytes.length; i++){  
            if(i != 0)  
                buffer.append("-");  
            //bytes[i]&0xff将有符号byte数值转换为32位有符号整数，其中高24位为0，低8位为byte[i]  
            int intMac = bytes[i]&0xff;  
            //toHexString函数将整数类型转换为无符号16进制数字  
            String str = Integer.toHexString(intMac);  
            if(str.length() == 0){  
                buffer.append("0");  
            }  
            buffer.append(str);  
        }  
        return buffer.toString().toUpperCase();  
    }  
    public static void main(String[] args) {  
        try {  
            InetAddress adress = InetAddress.getLocalHost();  
            NetworkInterface net = NetworkInterface.getByInetAddress(adress);  
            byte[] macBytes = net.getHardwareAddress();  
            System.out.println(transBytesToStr(macBytes));  
        } catch (UnknownHostException e) {  
            e.printStackTrace();  
        } catch (SocketException e) {  
            e.printStackTrace();  
        }  
    } 
}
