package test1;

import java.util.concurrent.ThreadLocalRandom;

public class SerialNumber {
    /**
     * 创建流水号
     *
     * @param type           类型
     * @param organizationId 零售店ID/仓库ID
     * @param spgId          品类编号
     * @param date           创建日期
     * @return
     */
    public static String createOrderCode(String type, String organizationId, String spgId, String date) {
        StringBuffer buffer = new StringBuffer();
        buffer.append(type);
        buffer.append(organizationId);
        buffer.append(spgId);
        buffer.append(date);
        // 生成随机数
        ThreadLocalRandom.current().ints(0, 9).limit(10).forEach(buffer::append);

        return buffer.toString();
    }

    public static void main(String[] args) {
        String code = createOrderCode("S", "000012", "11002", "20180514");
        System.out.println(code);
    }
}
