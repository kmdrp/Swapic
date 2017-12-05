package controller;


import db.dao.RoomDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

public class BoardController implements Controller {
    RoomDAO dao;

    public void execute(HttpServletRequest request, HttpServletResponse response) {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json");

        try {
            request.setCharacterEncoding("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        dao = new RoomDAO();
        ArrayList list = (ArrayList) dao.selectAll();
        request.setAttribute("list", list);

    }

    public String getResultView() {
        return "/swpc/board.jsp";
    }

    public boolean isFoward() {
        return true;
    }
}
