package controller;

import db.dao.RoomDAO;
import org.json.simple.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewRoomController implements Controller{
    RoomDAO dao=null;
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        dao = new RoomDAO();
        String roomNo= "";

        String title = request.getParameter("title");
        String owner = request.getParameter("owner");
        String password = request.getParameter("password");
        System.out.println(" #newroom title: " + title +"//owner: " +owner +"// password: " + password);

        roomNo = dao.newRoom(title, owner, password);
        JSONObject json = new JSONObject();

        if(roomNo.equals("0")){
            json.put("result", "0");
        }else{
            json.put("room_no", roomNo);
            json.put("result", "1");
        }
        request.setAttribute("json",json.toString());

    }


    public String getResultView() {
        return "/swpc/board.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
