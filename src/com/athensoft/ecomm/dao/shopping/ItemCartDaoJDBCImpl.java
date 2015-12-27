package com.athensoft.ecomm.dao.shopping;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.athensoft.ecomm.entity.shopping.ItemCart;

@Component("itemCartDaoParam")
public class ItemCartDaoJDBCImpl implements ItemCartDao {

	private NamedParameterJdbcTemplate jdbc;

	/**
	 * inject DataSource object
	 * @param dataSource
	 */
	@Autowired
	public void setDataSource(DataSource dataSource){
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}
	
	@Override
	public List<ItemCart> findAll() {
		List<ItemCart> list = new ArrayList<ItemCart>();
				
		String sql = "select ItemId,ItemCode,ItemName,ItemDesc,price,qty from item_cart";
		return jdbc.query(sql, new ItemCartRowMapper());				

	}

	@Override
	public ItemCart findItemCartById(int itemId) {
		String sql = "select ItemId,ItemCode,ItemName,ItemDesc,price,qty from item_cart where ItemId=:itemId";
		MapSqlParameterSource paramSource = new MapSqlParameterSource();
		paramSource.addValue("itemId", itemId);
		return jdbc.queryForObject(sql, paramSource, new ItemCartRowMapper());
	}
	
	
	private static class ItemCartRowMapper implements RowMapper<ItemCart>{
		public ItemCart mapRow(ResultSet rs, int rowNumber) throws SQLException {
			ItemCart x = new ItemCart();
			x.setItemId(rs.getInt("ItemId"));
			x.setItemCode(rs.getString("ItemCode"));
			x.setItemName(rs.getString("ItemName"));
			x.setItemDesc(rs.getString("ItemDesc"));
			x.setPrice(rs.getFloat("price"));
			x.setQty(1);  //add to cart and set qty to 1 initially
            return x;
		}		
	}

	

}
