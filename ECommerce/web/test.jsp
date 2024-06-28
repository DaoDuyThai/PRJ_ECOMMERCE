<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Pagination Example</title>
  </head>
  <body>
    <%! 
      // Function to change the value of a parameter in the current URL
      String changeValue(String paramName, String paramValue, javax.servlet.http.HttpServletRequest request) throws java.io.UnsupportedEncodingException {
          StringBuilder newUrl = new StringBuilder(request.getRequestURL().toString());
          String queryString = request.getQueryString();
          boolean paramExists = false;
          
          if (queryString != null && !queryString.isEmpty()) {
              String[] params = queryString.split("&");
              for (int i = 0; i < params.length; i++) {
                  if (params[i].startsWith(paramName + "=")) {
                      params[i] = paramName + "=" + java.net.URLEncoder.encode(paramValue, "UTF-8");
                      paramExists = true;
                  }
              }
              newUrl.append("?").append(String.join("&", params));
          } 
          
          if (!paramExists) {
              if (queryString != null && !queryString.isEmpty()) {
                  newUrl.append("&");
              } else {
                  newUrl.append("?");
              }
              newUrl.append(paramName).append("=").append(java.net.URLEncoder.encode(paramValue, "UTF-8"));
          }

          return newUrl.toString();
      }
    %>
    
    <%
      try {
          // Example usage of the changeValue function
          String newUrl = changeValue("page", "3", request);
          out.println("New URL: " + newUrl);
      } catch (Exception e) {
          out.println("Error: " + e.getMessage());
      }
    %>
  </body>
</html>
