package com.user.model;

import java.util.Date;

import lombok.Data;

@Data
public class DitchVO {
	private int dnum;
	private int idx;
	private String top_code;
	private String mid_code;
	private String bottom_code;
	private Date indate;
}
