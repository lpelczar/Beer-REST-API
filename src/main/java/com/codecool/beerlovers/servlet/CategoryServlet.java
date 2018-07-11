package com.codecool.beerlovers.servlet;

import com.codecool.beerlovers.beerdb.config.AppConfig;
import com.codecool.beerlovers.beerdb.model.Category;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.mysql.cj.util.StringUtils;


import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;


@WebServlet("/categories/*")
public class CategoryServlet extends HttpServlet {

    private EntityManager em = new AppConfig().entityManager();
    private ObjectMapper objectMapper = new ObjectMapper();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String path = req.getPathInfo();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        if(path == null || path.equals("/")) {
            List<Category> categories = em.createQuery("SELECT c FROM Category c", Category.class).getResultList();
            resp.getWriter().write(objectMapper.writeValueAsString(categories));

        }else{
            String[] splits = path.split("/");
            if(splits.length != 2 || !StringUtils.isStrictlyNumeric(splits[1])){
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }else{
                int id = Integer.valueOf(splits[1]);
                if(isCategoryInDatabase(id)) {
                    Category category = em.createQuery("SELECT c FROM Category c WHERE id = :idFromURI", Category.class)
                            .setParameter("idFromURI", id).getSingleResult();
                    String catToJSON = objectMapper.writeValueAsString(category);
                    resp.getWriter().write(catToJSON);
                }else{
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
                }
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String json = getJson(req, resp);
        Category category = objectMapper.readValue(json, Category.class);
        if(!isCategoryInDatabase(category.getId())) {
            em.getTransaction().begin();
            em.persist(category);
            em.getTransaction().commit();
        }else{
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
        resp.sendRedirect("/categories/" + category.getId());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        em.getTransaction().begin();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        if(path == null || path.equals("/")) {
            Query query = em.createQuery("DELETE FROM Category");
            query.executeUpdate();
            em.getTransaction().commit();

        }else{
            String[] splits = path.split("/");
            if(splits.length != 2 || !StringUtils.isStrictlyNumeric(splits[1])){
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }else{
                int id = Integer.valueOf(splits[1]);
                if(isCategoryInDatabase(id)) {
                    Category category = em.createQuery("SELECT c FROM Category c WHERE id = :idFromURI", Category.class)
                            .setParameter("idFromURI", id).getSingleResult();
                    em.remove(category);
                    em.getTransaction().commit();
                }else{
                    resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
                }
            }
        }
        resp.sendRedirect("/categories/");

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String json = getJson(req, resp);
        Category category = objectMapper.readValue(json, Category.class);
        if(isCategoryInDatabase(category.getId())) {
            em.getTransaction().begin();
            Category updateCategory = em.find(Category.class, category.getId());
            updateCategory.setName(category.getName());
            em.getTransaction().commit();
        }else if(category.getId() != 0){
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }else{
            em.getTransaction().begin();
            em.persist(category);
            em.getTransaction().commit();
        }

        resp.sendRedirect("/categories/");

    }
    private String getJson(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        try {
            BufferedReader reader = req.getReader();
            while ((line = reader.readLine()) != null)
                stringBuilder.append(line);
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
        return stringBuilder.toString();
    }


    private boolean isCategoryInDatabase(int id){
        Query query = em.createQuery("SELECT c FROM Category c WHERE id = :idFromURI", Category.class)
                .setParameter("idFromURI", id);
        return (query.getResultList().size() == 1);
    }
}
