package com.HTTP_REQ_RES;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/processResult")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String roll = request.getParameter("rollno");
        String name = request.getParameter("name");

        String message = "";
        boolean isValid = true;

        int marks[] = new int[5];

        try {
            for (int i = 0; i < 5; i++) {
                marks[i] = Integer.parseInt(request.getParameter("sub" + (i + 1)));

                if (marks[i] < 0 || marks[i] > 100) {
                    isValid = false;
                }
            }
        } catch (Exception e) {
            isValid = false;
        }

        if (roll == null || roll.trim().isEmpty() || name == null || name.trim().isEmpty()) {
            message = "Roll No and Name are required!";
            isValid = false;
        }

        int total = 0;
        boolean pass = true;

        if (isValid) {
            for (int m : marks) {
                total += m;
                if (m < 40) {
                    pass = false;
                }
            }
        }

        double average = total / 5.0;

        String result = pass ? "PASS" : "FAIL";

        if (!isValid) {
            message = "Invalid input! Please enter correct details.";
        } else {
            message = "Result calculated successfully!";
        }

        // Set attributes
        request.setAttribute("roll", roll);
        request.setAttribute("name", name);
        request.setAttribute("marks", marks);
        request.setAttribute("total", total);
        request.setAttribute("average", average);
        request.setAttribute("result", result);
        request.setAttribute("message", message);

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}