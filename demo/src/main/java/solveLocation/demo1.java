package solveLocation;

import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.HashMap;

public class demo1 {
    public static void main(String[] args) {
        HashMap map = new HashMap();
        map.put("key", "4a075c77ac3c0f40d0c19eb2056a46d9");
        map.put("address", "深圳市南山区西丽街道");
        String res = HttpUtil.get("https://restapi.amap.com/v3/geocode/geo", map);
        // 把字符串转化为 json格式
        JSON json = JSONUtil.parse(res);
        // 提取经纬度数据
        String location = json.getByPath("geocodes[0].location", String.class);
        String lng = location.split(",")[0]; // 经度
        String lat = location.split(",")[1]; // 纬度
//        System.out.println(lng);
//        System.out.println(lat);

        // 加载驱动，为连接数据库做准备
        try {
            DriverManager.registerDriver(new Driver());
            String url = "jdbc:mysql//localhost:3306/neti?serverTimezone=GMT%2B8";
            String username = "root";
            String password = "qwe123";
            Connection con = DriverManager.getConnection(url, username, password);
            String sql = "SELECT\n" +
                    "\tt.id\n" +
                    "FROM\n" +
                    "(SELECT\n" +
                    "\tw.id,\n" +
                    "\taddress,\n" +
                    "\tst_distance(\n" +
                    "\t\tpoint(?, ?),\n" +
                    "\t\tpoint(w.lng, w.lat)\n" +
                    "\t) * 111195 / 1000 AS distance\n" +
                    "FROM t_warehouse w\n" +
                    "JOIN t_warehouse_sku ws ON ws.warehouse_id = w.id AND ws.sku_id = ? AND ws.num >= ?\n" +
                    "ORDER BY distance \n" +
                    "LIMIT 1) t;";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setObject(1, lng); // 经度
            pst.setObject(2, lat); // 纬度
            pst.setObject(3, 1); // 商品编号
            pst.setObject(4, 1); // 购买的商品数量

            // 执行 sql 语句
            ResultSet set = pst.executeQuery();
            while(set.next()){ // 获取结果数据
                int id = set.getInt("id");
                System.out.println(id);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
