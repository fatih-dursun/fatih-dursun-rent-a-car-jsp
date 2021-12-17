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
import beanPack.Car;
import beanPack.Rent;
import beanPack.RentStatus;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

public class CarDB {

    public static String insert(Car car) throws IOException {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO car (model, years, gear,price,fuel,plata ,photo) VALUES (?, ?, ?, ?, ?, ?,?)";

        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, car.getModel());
            ps.setString(2, car.getYears());
            ps.setString(3, car.getGear());
            ps.setString(4, car.getPrice());
            ps.setString(5, car.getFuel());
            ps.setString(6, car.getPlata());
            ps.setBlob(7, car.getInputStream());
            ps.executeUpdate();
            String a = "Araç Ekleme Başarılı";
            return a;
        } catch (SQLException e) {
            System.out.println(e);
            String s = "Araç Ekleme Başarısız";
            return s;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static int updateNoImage(Car car) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Update car Set Model=?,Years=?,Gear=?,Fuel=?,Price=? Where Plata=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, car.getModel());
            ps.setString(2, car.getYears());
            ps.setString(3, car.getGear());
            ps.setString(4, car.getFuel());
            ps.setString(5, car.getPrice());
            ps.setString(6, car.getPlata());
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

    public static int updateInImage(String plata, InputStream inputSr) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Update car Set Photo=? Where Plata=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setBlob(1, inputSr);
            ps.setString(2, plata);
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

    public static int plataUnique(Car car) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(Plata) As counter FROM Car Where Plata= ?";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, car.getPlata());
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

    public static ArrayList<Car> listCar() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        ArrayList<Car> carList = new ArrayList<Car>();

        String query = "SELECT * FROM Car";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            Car car = null;
            while (rs.next()) {
                car = new Car();
                car.setModel(rs.getString("Model"));
                car.setYears(rs.getString("Years"));
                car.setGear(rs.getString("Gear"));
                car.setFuel(rs.getString("Fuel"));
                car.setPrice(rs.getString("Price"));
                car.setPlata(rs.getString("Plata"));
                byte[] imgData = rs.getBytes("photo"); // blob field 
                if (imgData != null) {
                    car.setEncode(Base64.getEncoder().encodeToString(imgData));
                }
                carList.add(car);
            }
            return carList;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int deleteCar(String plata) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "DELETE from car WHERE plata=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, plata);
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

    public static Car createCare(String plata) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT * FROM Car "
                + "WHERE plata = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, plata);
            rs = ps.executeQuery();
            Car car = null;
            if (rs.next()) {
                car = new Car();
                car.setModel(rs.getString("Model"));
                car.setYears(rs.getString("Years"));
                car.setGear(rs.getString("Gear"));
                car.setFuel(rs.getString("Fuel"));
                car.setPrice(rs.getString("Price"));
                car.setPlata(rs.getString("Plata"));
                byte[] imgData = rs.getBytes("photo"); // blob field 
                car.setEncode(Base64.getEncoder().encodeToString(imgData));
            }

            return car;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int statusRentCar(String startDate, String endDate, String cid) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(cid) As counter FROM rentlist Where ? BETWEEN startDate AND endDate AND cid=?  OR ? BETWEEN startDate AND endDate AND cid=? OR ( ? <startDate AND ? > endDate AND cid=?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, cid);
            ps.setString(3, endDate);
            ps.setString(4, cid);
            ps.setString(5, startDate);
            ps.setString(6, endDate);
            ps.setString(7, cid);
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

    public static int cidRentCar(String plata) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int c = 0;
        String query = "SELECT carID As cid FROM Car Where plata= ?";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, plata);
            rs = ps.executeQuery();
            while (rs.next()) {
                c = rs.getInt("cid");
            }

            return c;
        } catch (SQLException e) {
            System.out.println(e);
            return c;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static int insertRentaCar(Rent rent, int uid, String rentContent, int rentStatus) throws IOException {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query = "INSERT INTO rentlist (uid, cid, startDate, endDate, rentPrice, rentContent, rentStatus,day) VALUES (?, ?, ?, ?, ?, ?,?,?)";

        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, uid);
            ps.setString(2, rent.getCid());
            ps.setString(3, rent.getStartDate());
            ps.setString(4, rent.getEndDate());
            ps.setString(5, rent.getRentPrice());
            ps.setString(6, rentContent);
            ps.setInt(7, rentStatus);
            ps.setInt(8, rent.getDay());
            ps.executeUpdate();
            int a = 1;
            return a;
        } catch (SQLException e) {
            System.out.println(e);
            int s = 0;
            return s;
        } finally {
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }

    }

    public static ArrayList<Integer> searchRentCar(String startDate, String endDate) {
        ArrayList<Integer> cidList = new ArrayList<Integer>();

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;
        String query = "SELECT DISTINCT cid As counter FROM rentlist Where ? BETWEEN startDate AND endDate  OR ? BETWEEN startDate AND endDate OR ( ? <startDate AND ? > endDate)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ps.setString(3, startDate);
            ps.setString(4, endDate);
            rs = ps.executeQuery();
            while (rs.next()) {
                String c = rs.getString("counter");
                a = Integer.valueOf(c);
                cidList.add(a);
            }
            return cidList;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Integer> searchAllCid() {
        ArrayList<Integer> cidAllList = new ArrayList<Integer>();

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;
        String query = "SELECT carID As counter FROM Car";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String c = rs.getString("counter");
                a = Integer.valueOf(c);
                cidAllList.add(a);
            }
            return cidAllList;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
    }

    public static ArrayList<Car> searchListCar(ArrayList<Integer> searchCidList) {
        int count = searchCidList.size();
        ArrayList<Car> carList = new ArrayList<Car>();
        for (int i = 0; i < count; i++) {
            ConnectionPool pool = ConnectionPool.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement ps = null;
            ResultSet rs = null;

            String query = "SELECT * FROM Car "
                    + "WHERE carID = ?";

            try {
                ps = connection.prepareStatement(query);
                ps.setInt(1, searchCidList.get(i));
                rs = ps.executeQuery();
                Car car = null;
                if (rs.next()) {
                    car = new Car();
                    car.setModel(rs.getString("Model"));
                    car.setYears(rs.getString("Years"));
                    car.setGear(rs.getString("Gear"));
                    car.setFuel(rs.getString("Fuel"));
                    car.setPrice(rs.getString("Price"));
                    car.setPlata(rs.getString("Plata"));
                    byte[] imgData = rs.getBytes("photo"); // blob field 
                    car.setEncode(Base64.getEncoder().encodeToString(imgData));
                }
                carList.add(car);
            } catch (SQLException e) {
                System.out.println(e);
                return null;
            } finally {
                DBUtil.closeResultSet(rs);
                DBUtil.closePreparedStatement(ps);
                pool.freeConnection(connection);
            }
        }
        return carList;
    }

    public static ArrayList<RentStatus> searchRentStatus(String status) {
        ArrayList<RentStatus> rentStatusList = new ArrayList<RentStatus>();

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT rentlist.startDate AS startDate1, rentlist.endDate AS endDate1, rentlist.rentPrice, rentlist.idrentList, rentlist.rentContent, rentlist.day, car.model AS model1, car.plata AS plata1, car.price, user.email AS email1, rentlist.rentStatus FROM rentlist INNER JOIN user ON rentlist.uid = user.iduser INNER JOIN car ON rentlist.cid = car.carID WHERE rentStatus = ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            RentStatus rentStatus = null;
            while (rs.next()) {
                rentStatus = new RentStatus();
                rentStatus.setDay(rs.getInt("day"));
                rentStatus.setEmail1(rs.getString("email1"));
                rentStatus.setEndDate1(rs.getString("EndDate1"));
                rentStatus.setModel1(rs.getString("Model1"));
                rentStatus.setPrice(rs.getString("price"));
                rentStatus.setRentContent(rs.getString("RentContent"));
                rentStatus.setRentPrice(rs.getString("RentPrice"));
                rentStatus.setRentStatus(rs.getString("RentStatus"));
                rentStatus.setStartDate1(rs.getString("StartDate1"));
                rentStatus.setPlata(rs.getString("plata1"));
                rentStatus.setIdrentList(rs.getInt("idrentList"));
                rentStatusList.add(rentStatus);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return rentStatusList;
    }

    public static int rentUpdateStatus(String idRentList, String statusValues) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Update rentlist Set rentStatus=? Where idrentList=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, statusValues);
            ps.setString(2, idRentList);
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

    public static int rentDeleteStatus(String idRentList) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;

        String query
                = "Delete From rentlist Where idrentList=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, idRentList);
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

    public static ArrayList<RentStatus> searchRentStatusUser(String status, String email) {
        ArrayList<RentStatus> rentStatusList = new ArrayList<RentStatus>();

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;

        String query = "SELECT rentlist.startDate AS startDate1, rentlist.endDate AS endDate1, rentlist.rentPrice, rentlist.idrentList, rentlist.rentContent, rentlist.day, car.model AS model1, car.plata AS plata1, car.price, user.email AS email1, rentlist.rentStatus FROM rentlist INNER JOIN user ON rentlist.uid = user.iduser INNER JOIN car ON rentlist.cid = car.carID WHERE rentStatus = ? AND user.email= ?";

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, email);
            rs = ps.executeQuery();
            RentStatus rentStatus = null;
            while (rs.next()) {
                rentStatus = new RentStatus();
                rentStatus.setDay(rs.getInt("day"));
                rentStatus.setEmail1(rs.getString("email1"));
                rentStatus.setEndDate1(rs.getString("EndDate1"));
                rentStatus.setModel1(rs.getString("Model1"));
                rentStatus.setPrice(rs.getString("price"));
                rentStatus.setRentContent(rs.getString("RentContent"));
                rentStatus.setRentPrice(rs.getString("RentPrice"));
                rentStatus.setRentStatus(rs.getString("RentStatus"));
                rentStatus.setStartDate1(rs.getString("StartDate1"));
                rentStatus.setPlata(rs.getString("plata1"));
                rentStatus.setIdrentList(rs.getInt("idrentList"));
                rentStatusList.add(rentStatus);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        } finally {
            DBUtil.closeResultSet(rs);
            DBUtil.closePreparedStatement(ps);
            pool.freeConnection(connection);
        }
        return rentStatusList;
    }

    public static int countCar() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(*)As counter FROM Car";
        try {

            ps = connection.prepareStatement(query);
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

    public static int countUser() {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(*)As counter FROM User";
        try {

            ps = connection.prepareStatement(query);
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

    public static int countRentStatic(String status) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        int a = 0;

        String query = "SELECT COUNT(*)As counter FROM rentlist Where rentStatus=?";
        try {

            ps = connection.prepareStatement(query);
            ps.setString(1, status);
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
}
