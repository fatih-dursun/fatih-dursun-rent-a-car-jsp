/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import beanPack.Feature;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author lenova
 */
public class FeatureDB {

    public static int updateFields(String property, String information) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "UPDATE Feature SET "
                + "property = ?, "
                + "information = ? "
                + "WHERE property = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, property);
            ps.setString(2, information);
            ps.setString(3, property);
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

    public static int updateInImage(String property, InputStream inputSr) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Update Feature Set photo=? Where property=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setBlob(1, inputSr);
            ps.setString(2, property);
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

    public static Feature selectFeature(String property) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Feature "
                + "WHERE Property = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, property);
            rs = ps.executeQuery();
            Feature fields = null;
            if (rs.next()) {
                fields = new Feature();
                byte[] imgData = rs.getBytes("photo"); // blob field 
                if (imgData != null) {
                    fields.setEncode(Base64.getEncoder().encodeToString(imgData));
                }
            }
            return fields;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Feature> listFeature() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Feature> featureList = new ArrayList<Feature>();

        String query = "SELECT * FROM Feature";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Feature feature = null;
            while (rs.next()) {
                feature = new Feature();
                feature.setInformation(rs.getString("information"));
                feature.setProperty(rs.getString("property"));
                byte[] imgData = rs.getBytes("photo"); // blob field 
                if (imgData != null) {
                    feature.setEncode(Base64.getEncoder().encodeToString(imgData));
                } else {

                }
                featureList.add(feature);

            }
            return featureList;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static String selectInformation(String property) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String information = "";
        String query = "SELECT * FROM Feature "
                + "WHERE Property = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, property);
            rs = ps.executeQuery();
            if (rs.next()) {
                information = rs.getString("information");
            }
            return information;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }
}
