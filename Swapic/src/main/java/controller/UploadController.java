package controller;

import com.oreilly.servlet.MultipartRequest;
import org.json.simple.JSONObject;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.InetAddress;

public class UploadController implements Controller {
    String room_no = "";
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");

        String savPath = "/Users/keemmaang/Swapic/SwaPic/web/swpc/images";
        int maxFileSize = 1024 * 1024;
        String encType = "UTF-8";
        JSONObject object=null;

        String uri=request.getRequestURI();
        MultipartRequest mr = null;
        try {
            mr = new MultipartRequest(request, savPath, maxFileSize, encType);
            //System.out.println("mr :  "+mr);
            room_no = mr.getParameter("room_no");
            File file = mr.getFile("file");
            //System.out.println("file :"+file);
            String fileName = file.getName();
            //System.out.println("  # fileName : "+fileName);
            String ip="http://180.66.116.97:8888/swpc/images/";
            object= new JSONObject();
            object.put("roomNo", room_no);
            object.put("filename", fileName);
            object.put("savPath", ip);
        } catch (IOException e) {
            e.printStackTrace();
        }
        request.setAttribute("json", object.toString());
    }

    public String getResultView() {
        return "/swpc/home.jsp";
    }

    public boolean isFoward() {
        return true;
    }
    //넘길때 방 번호 , 파일 이름 , 보낸 사람아이디


}
