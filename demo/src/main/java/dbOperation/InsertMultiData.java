package dbOperation;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.UUID;

public class InsertMultiData {
    public static void main(String[] args) {
        try{
            FileWriter w = new FileWriter("D:\\Computer-Science\\Github_Projects\\New-retail-db-design\\resource\\1.txt");
            BufferedWriter bw = new BufferedWriter(w);

            for(int i = 1;i <= 10000000;i++){
                String uuid = UUID.randomUUID().toString();
                bw.write(i + "," + uuid + "\n");
            }

            bw.close();
            w.close();
            System.out.println("执行完毕！");
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
