<%-- 
    Document   : ViewBookings
    Created on : 21 Dec, 2021, 12:50:02 PM
    Author     : hp
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Bookings</title>
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <h2>Bookings</h2>
        <br> <br>
        <table align='center' border="1" width="50%" >
            <tr>
                <th>SL.No</th>

                <th>Product</th>
                <th>Date</th>
                <th>Qty</th>
                <th>Status</th>
            </tr>
            <%                int i = 0;
                String selQry = "select * from tbl_booking b inner join tbl_cart c on c.booking_id=b.booking_id  inner join tbl_product p on p.product_id=c.product_id inner join tbl_housewife u on u.housewife_id=p.housewife_id where user_id='" + session.getAttribute("uid") + "' and booking_status>0";
                ResultSet rs = con.selectCommand(selQry);
                while (rs.next()) {
                    i++;

            %>
            <tr>
                <td><%=i%></td>

                <td><%=rs.getString("product_name")%></td>
                <td><%=rs.getString("booking_date")%></td>
                <td><%=rs.getString("cart_qty")%></td>
                <td><%
                    if (rs.getString("cart_status").equals("1")) {
                        out.println("Payment Completed ,Waiting List");
                    } else if (rs.getString("cart_status").equals("2")) {
                        out.println("Packed");
                    } else if (rs.getString("cart_status").equals("3")) {
                        out.println("Shiped");
                    } else if (rs.getString("cart_status").equals("4")) {
                        %>
                            Delivered <a href="Review.jsp?id=<%=rs.getString("product_id")%>">Review</a>
                        <%
                        }

                    %></td>
            </tr>         
            <%                }


            %> 
        </table>
        <br><br><br><br><br>
        <%@include file="Foot.jsp" %>
    </body>
</html>
