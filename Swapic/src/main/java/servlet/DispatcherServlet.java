package servlet;

import controller.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DispatcherServlet extends HttpServlet {
    Controller cont;
    String viewpage;
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doRequest(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doRequest(req,resp);
    }
    protected void doRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String uri = req.getRequestURI();
        System.out.println(getTime()+" requset -> "+uri);
        if (uri.equals("/board.do")) {
            cont = new BoardController();

        } else if (uri.equals("/upload.do")) {
            cont = new UploadController();
        }else if(uri.equals("/newRoom.do")){
            cont = new NewRoomController();
        } else if (uri.equals("/makeRoom.do")) {
            System.out.println("!");
        } else if (uri.equals("/room.do")) {
            cont = new RoomController();
        }
        viewpage=cont.getResultView();
        RequestDispatcher dispatcher=null;
        cont.execute(req, resp);
        if(cont.isFoward()){
            String json="";
            if(uri.equals("/newRoom.do")){
                json =(String) req.getAttribute("json");
                resp.getWriter().println(json);
                resp.getWriter().flush();
            }else if(uri.equals("/upload.do")){
                json = (String) req.getAttribute("json");
                System.out.println(json);
                resp.getWriter().println(json);
                resp.getWriter().flush();
            }else{
                dispatcher = req.getRequestDispatcher(viewpage);
                dispatcher.forward(req, resp);
            }
        } else{
            resp.sendRedirect(viewpage);
        }
    }
    public String getTime(){
        SimpleDateFormat form=new SimpleDateFormat("[hh:mm:ss]");
        String now=form.format(new Date());
        return now;
    }

}
