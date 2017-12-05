package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RoomController implements Controller {
    public void execute(HttpServletRequest request, HttpServletResponse response) {
        String room_no = request.getParameter("room_no");
        System.out.println(" %room con no: " +room_no);
    }

    public String getResultView() {
        return "/swpc/home.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
