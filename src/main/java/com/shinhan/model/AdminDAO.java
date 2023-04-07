package com.shinhan.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.shinhan.util.OracleUtil;
import com.shinhan.vo.AdminVO;


public class AdminDAO {
		Connection conn;
		PreparedStatement st;
		ResultSet rs;
		
		public int registerAdmin(AdminVO admin) {
			int result = 0;
			String sql=" insert into admins(email, pass, manager_name) values(?,?,?)";
			conn = OracleUtil.getConnection();
			try {
				st = conn.prepareStatement(sql);
				st.setString(1, admin.getEmail());
				st.setString(2, admin.getPass());
				st.setString(3, admin.getManager_name());
				result = st.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				OracleUtil.dbDisconnect(rs, st, conn);
			}
			return result;
		}
		
		public int dupCheck(String email) {
			int count=0;
			String sql = "select count(*) from Admins where email=?";
			conn = OracleUtil.getConnection();
			try {
				st = conn.prepareStatement(sql);
				st.setString(1, email);
				rs = st.executeQuery();
				
				while (rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				OracleUtil.dbDisconnect(rs, st, conn);
			}
			return count;
		}
		
	// 특정직원 조회
		public AdminVO loginCheck(String email, String pass) {
			AdminVO admin = null;
			String sql = "select manager_name from Admins where email=? and pass=?";
			conn = OracleUtil.getConnection();
			try {
				st = conn.prepareStatement(sql);
				st.setString(1, email);
				st.setString(2, pass);
				rs = st.executeQuery();
				
				while (rs.next()) {
					admin = new AdminVO(email, rs.getString(1), pass);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				OracleUtil.dbDisconnect(rs, st, conn);
			}
			return admin;
		}
}
