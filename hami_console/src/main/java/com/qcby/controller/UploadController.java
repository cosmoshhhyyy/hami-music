package com.qcby.controller;

import com.alibaba.fastjson.JSONObject;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * 文件上传Controller
 */
@Controller
@RequestMapping("/upload")
public class UploadController {

    /**
     * 图片上传方法
     * @param httpServletRequest
     * @param httpServletResponse
     * @param picfile 上传的文件
     * @param fileType 类型
     */
    @RequestMapping("/uploadFile")
    public void uploadFile(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, MultipartFile picfile , String fileType, String lastImg) throws IOException {

        // 获取文件数组
        byte[] bytes = picfile.getBytes();
        // 获取文件名称
        String originalFilename = picfile.getOriginalFilename();
        // 获取文件后缀，参数新名字
        String suffix = originalFilename.substring(originalFilename.lastIndexOf('.'));
        //  定义一个新名字
        String fileName = UUID.randomUUID().toString();
        fileName = fileName + suffix;
        // 获取上传的位置
        String filePath = "http://localhost:8083";

        String realPath = filePath +  "/" + fileType + "/" + fileName;
        String relativePath = "/" + fileType + "/" + fileName;
        // 客户端上传
        Client client = Client.create();
        if (lastImg != null && !"".equals(lastImg)) {
            WebResource resource1 = client.resource(lastImg);
            resource1.delete();
        }
        WebResource resource = client.resource(realPath);

        // 上传
        resource.put(bytes);

        // 创建json对象返回
        JSONObject jo =  new JSONObject();

        jo.put("realPath", realPath);
        jo.put("relativePath", relativePath);

        // 返回
        httpServletResponse.getWriter().write(jo.toString());
    }

    @RequestMapping("/uploadFileMp3")
    public void uploadFileMp3(HttpServletRequest request, HttpServletResponse response, String fileType, String lastMp3) throws IOException {
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;

        Map<String, MultipartFile> fileMap = mr.getFileMap();

        MultipartFile file = fileMap.get("mp3file");

        // 获取文件数组
        byte[] bytes = file.getBytes();

        String originalFilename = file.getOriginalFilename();

        // 获取文件后缀，参数新名字
        String suffix = originalFilename.substring(originalFilename.lastIndexOf('.'));
        //  定义一个新名字
        String fileName = UUID.randomUUID().toString();
        fileName = fileName + suffix;
        // 获取上传的位置
        String filePath = "http://localhost:8083";

        String realPath = filePath +  "/" + fileType + "/" + fileName;
        String relativePath = "/" + fileType + "/" + fileName;
        // 客户端上传
        Client client = Client.create();
        if (lastMp3 != null && !"".equals(lastMp3)) {
            WebResource resource1 = client.resource(lastMp3);
            resource1.delete();
        }
        WebResource resource = client.resource(realPath);

        // 上传
        resource.put(bytes);

        // 创建json对象返回
        JSONObject jo =  new JSONObject();

        jo.put("realPath", realPath);
        jo.put("relativePath", relativePath);

        // 返回
        response.getWriter().write(jo.toString());
    }
}
