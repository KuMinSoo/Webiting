package com.admin.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderstatsVO {
	private int orderednum;
	private Date ordered_date;
	private int saleprice;
	
	private int pnum_fk;
	private int pk_count;
	private String pname;
	private int oqty;
	
	private int idx_fk;			
}
