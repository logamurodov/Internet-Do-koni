package uz.pdp.category.filter;

import uz.pdp.category.entity.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

@WebFilter("/*")
public class Filter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

        if (req.getRequestURI().contains("/admin")) {
            HttpSession session = req.getSession();
            User user = Objects.requireNonNullElse((User) session.getAttribute("user"),new User());
            if (user.getRole().equals("admin") ) {
                chain.doFilter(req, res);

            }else {
                res.sendRedirect("/user/categoryuser.jsp");

            }


        } else {
            chain.doFilter(req, res);
        }
    }
}
