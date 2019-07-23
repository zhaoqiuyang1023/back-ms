package com.back.ms.util;

import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Yh Zeng
 * @since 2019-3-26
 */
public class HttpUtils {
    /**
     * 上传单个文件保存到文件服务上
     * @param filestoreUrl
     * @param file
     * @return
     */
    public static Map<String, Object> uploadFile(String filestoreUrl, MultipartFile file) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            // 换行符
            final String newLine = "\r\n";
            final String boundaryPrefix = "--";
            // 定义数据分隔线
            String BOUNDARY = "---------------------------7d4a6d158c9";
            // 服务器的域名
            URL url = new URL(filestoreUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            // 设置为POST情
            conn.setRequestMethod("POST");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            // 设置请求头参数
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("Charsert", "UTF-8");
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

            OutputStream out = new DataOutputStream(conn.getOutputStream());

            // 上传文件
            StringBuilder sb = new StringBuilder();
            sb.append(boundaryPrefix);
            sb.append(BOUNDARY);
            sb.append(newLine);
            // 文件参数,files参数名可以随意修改，但需要与被调用保持一致
            sb.append("Content-Disposition: form-data;name=\"files\";filename=\"" + file.getOriginalFilename()
                    + "\"" + newLine);

            sb.append("Content-Type:" + file.getContentType());
            // 参数头设置完以后需要两个换行，然后才是参数内容
            sb.append(newLine);
            sb.append(newLine);
            String tt = sb.toString();
            System.out.println(">>>>>>>>>>>文件头内容:" + tt);

            // 将参数头的数据写入到输出流中
            out.write(sb.toString().getBytes());

            // 数据输入流,用于读取文件数据
            DataInputStream in = new DataInputStream(file.getInputStream());
            byte[] bufferOut = new byte[1024];
            int bytes = 0;
            // 每次读1KB数据,并且将文件数据写入到输出流中
            while ((bytes = in.read(bufferOut)) != -1) {
                out.write(bufferOut, 0, bytes);
            }
            // 最后添加换行
            out.write(newLine.getBytes());
            in.close();

            // 定义最后数据分隔线，即--加上BOUNDARY再加上--。
            byte[] end_data = (newLine + boundaryPrefix + BOUNDARY + boundaryPrefix + newLine).getBytes();
            // 写上结尾标识
            out.write(end_data);
            out.flush();
            out.close();

            StringBuffer buffer = new StringBuffer();
            // 定义BufferedReader输入流来读取URL的响应
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    conn.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                buffer.append(line);
            }
            System.out.println(">>>>>>>>>>>调用返回内容:" + buffer);

            JSONObject jsonObject = JSONObject.parseObject(buffer.toString());
            if (jsonObject == null ) {
                map.put("error", 1);
                map.put("message", "调用文件存储返回结果为空，请联系管理员检查。");
            }
            if (jsonObject.getIntValue("code") == 1) {
                map.put("error", 1);
                map.put("message", jsonObject.getString("msg"));
            } else {
                map.put("error", 0);
                map.put("url", jsonObject.getJSONArray("data").getJSONObject(0).getString("url"));
            }
        } catch (Exception e) {
            map.put("error", 1);
            map.put("message", e.getMessage());
        }
        return map;
    }
}
