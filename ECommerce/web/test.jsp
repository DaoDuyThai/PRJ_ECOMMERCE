<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change URL Parameter</title>
</head>
<body>
    <%
        // Function to change the value of a parameter in the URL
        String changeValue(String url, String paramName, String paramValue) {
            StringBuilder newUrl = new StringBuilder(url);
            String queryString = request.getQueryString();
            
            // Check if the URL already has a query string
            if (queryString != null && !queryString.isEmpty()) {
                String[] params = queryString.split("&");
                boolean paramFound = false;
                
                // Iterate through query parameters to find and replace the specified param
                for (int i = 0; i < params.length; i++) {
                    if (params[i].startsWith(paramName + "=")) {
                        params[i] = paramName + "=" + paramValue;
                        paramFound = true;
                        break;
                    }
                }
                
                // Reconstruct the URL with updated parameters
                if (paramFound) {
                    newUrl = new StringBuilder(request.getRequestURI() + "?");
                    newUrl.append(String.join("&", params));
                } else {
                    newUrl.append("&").append(paramName).append("=").append(paramValue);
                }
            } else {
                // If no existing query string, just append the parameter
                newUrl.append("?").append(paramName).append("=").append(paramValue);
            }
            
            return newUrl.toString();
        }
        
        // Example usage
        String originalUrl = "http://localhost:8080/ecommerce/store?page=2&category=laptop&tag=mac";
        String updatedUrl = changeValue(originalUrl, "page", "3");
    %>
    
    <p>Original URL: <%= originalUrl %></p>
    <p>Updated URL: <%= updatedUrl %></p>
</body>
</html>
