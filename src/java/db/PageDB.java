/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

/**
 *
 * @author lenova
 */
import beanPack.Page;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PageDB {

    public static int insert(Page page) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "INSERT INTO pages (Title, Content, Url) VALUES (?, ?, ?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, page.getTitle());
            ps.setString(2, page.getContent());
            ps.setString(3, page.getUrl());
            return ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static int update(Page page) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Update pages Set Content=? Where Url=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, page.getContent());
            ps.setString(2, page.getUrl());
            ps.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static int titleUnique(Page page) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(Title) As counter FROM Pages Where Title= ?";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, page.getTitle());
            rs = ps.executeQuery();
            while (rs.next()) {
                String c = rs.getString("counter");
                a = Integer.valueOf(c);
            }

            return a;
        } catch (SQLException e) {
            System.out.println(e);
            return a;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int urlUnique(Page page) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int b = 0;

        String query = "SELECT COUNT(Url) As counters FROM Pages Where Url= ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, page.getUrl());
            rs = ps.executeQuery();
            while (rs.next()) {
                String d = rs.getString("counters");
                b = Integer.valueOf(d);
            }

            return b;
        } catch (SQLException e) {
            System.out.println(e);
            return b;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static Page createPage(String url) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Pages "
                + "WHERE url = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, url);
            rs = ps.executeQuery();
            Page page = null;
            if (rs.next()) {
                page = new Page();
                page.setTitle(rs.getString("Title"));
                page.setContent(rs.getString("Content"));
                page.setUrl(rs.getString("Url"));
            }
            return page;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int urlControl(String url) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT urltype As urlcon FROM url Where urlcol= ?";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, url);
            rs = ps.executeQuery();
            while (rs.next()) {
                String lastName = rs.getString("urlcon");
                a = Integer.valueOf(lastName);
            }

            return a;
        } catch (SQLException e) {
            System.out.println(e);
            return a;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static String menuPage() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Pages ";

        try {
            //rs = ps.executeQuery(query);
            ps = connection.prepareStatement(query);
            //ps.setString(1, url);
            rs = ps.executeQuery();
            String ex = "";

            while (rs.next()) {
                String a = "<li class=\"rd-nav-item\"><a class=\"rd-nav-link\" href=\"" + "/Page?url=" + rs.getString("Url") + "\">" + rs.getString("Title") + "</a></li>";
                ex = ex + a;
            }
            return ex;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Page> listPage() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Page> pageList = new ArrayList<Page>();

        String query = "SELECT * FROM Pages";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Page page = null;
            while (rs.next()) {
                page = new Page();
                page.setTitle(rs.getString("Title"));
                page.setContent(rs.getString("Content"));
                page.setUrl(rs.getString("Url"));
                pageList.add(page);
            }
            return pageList;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deletePage(String url) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "DELETE from pages WHERE url=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, url);
            return ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

}
