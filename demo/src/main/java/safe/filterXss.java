package safe;

import org.owasp.validator.html.AntiSamy;

import java.security.Policy;

// 过滤xss攻击
public class filterXss {
    public static void main(String[] args) {
        String xss1 = "HelloWorld<img src='null' onerror='alert(1234)'>";
        String path = filterXss.class.getResource("antisamy.xml").getPath().toString();

//        try {
//            // 处理规则
//            Policy policy = Policy.getInstance(path);
//            AntiSamy samy = new AntiSamy();
//            String result = samy.scan(xss1, policy).getCleanHTML();
//            System.out.println(result);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
