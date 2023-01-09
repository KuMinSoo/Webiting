package com.user.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeVO {
	private int idx;
	private int pnum;
	private String pname;
	private String pimage1;
	private int lprice;
	private String pcompany;
	private java.sql.Date lindate;
	private int pqty;	
	private int likeval;
}
